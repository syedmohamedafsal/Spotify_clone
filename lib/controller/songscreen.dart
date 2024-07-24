import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spotify_clone/model/trackmodel.dart';

class SongScreenProvider with ChangeNotifier {
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isAdded = false;
  List<String> trackList = []; // List of track IDs
  int currentTrackIndex = 0;

  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  Track? currentTrack;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final String _baseUrl = 'https://spotify23.p.rapidapi.com';
  final String _endpoint = '/tracks';
  final String _apiKey = '9576b5b51fmsh20aed4fed746533p1a3df7jsnefd5018d202f';

  List<String> trackIds = [];
  List<SongModel> trackdata = [];
  int currentIndex = 0;

  SongScreenProvider() {
    // Listen for duration changes to update the total duration of the track
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      totalDuration = duration;
      notifyListeners();
    });

    // Listen for position changes to update the current position of the track
    _audioPlayer.onPositionChanged.listen((Duration position) {
      currentPosition = position;
      notifyListeners();
    });

    // Listen for player state changes to handle song completion
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        isPlaying = false;
        notifyListeners();
        playNextTrack();
      }
    });
  }

  Future<void> playSong(String trackId) async {
    final url = Uri.parse('$_baseUrl$_endpoint/?ids=$trackId');
    try {
      var response = await http.get(
        url,
        headers: {
          'x-rapidapi-host': 'spotify23.p.rapidapi.com',
          'x-rapidapi-key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['tracks'] != null &&
            jsonResponse['tracks'].isNotEmpty) {
          var trackData = jsonResponse['tracks'][0];

          if (trackData != null) {
            var audioUrl = trackData['preview_url'];
            var imageUrl = trackData['album']['images'][0]['url'];
            var trackName = trackData['name'];
            var artists = Artists1.fromList(
                List<Map<String, dynamic>>.from(trackData['artists']));
            print('imageurl.............$imageUrl');
            if (audioUrl != null && audioUrl.isNotEmpty) {
              await _audioPlayer.play(UrlSource(audioUrl));
              isPlaying = true;

              // Update the current track
              currentTrack = Track(
                id: trackData['id'],
                name: trackName,
                previewUrl: audioUrl,
                imageUrl: imageUrl,
                artists: artists,
              );

              notifyListeners();
            } else {
              print('Error: Audio URL is empty or null');
            }
          } else {
            print('Error: Track data is null');
          }
        } else {
          print('Error: Tracks data is null or empty');
        }
      } else {
        print('Error fetching track details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void pauseSong() {
    _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void resumeSong() {
    _audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }

  void seekTo(Duration position) {
    _audioPlayer.seek(position);
    notifyListeners();
  }

  void shuffleSongs() {
    // Toggle the shuffle mode
    isShuffle = !isShuffle;

    // Debugging information
    print('Shuffle mode is ${isShuffle ? 'ON' : 'OFF'}');

    if (isShuffle) {
      // Shuffle the trackList using bubble sort when shuffle mode is enabled
      bubbleSortShuffle(trackList);
      print('Track list shuffled');
    } else {
      // Sort the trackList in ascending order when shuffle mode is disabled
      trackList.sort();
      print('Track list sorted');
    }

    // Notify listeners about the change
    notifyListeners();
  }

  void bubbleSortShuffle(List<String> list) {
    int n = list.length;
    // Perform bubble sort-like shuffling
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        // Swap adjacent elements based on a random condition
        if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
          String temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
  }

  void skipNext() {
    print('Track list: $trackList'); // Debugging line
    if (trackList.isEmpty) {
      print('No tracks available to skip to the next.');
      return;
    }
    if (currentTrackIndex < 0 || currentTrackIndex >= trackList.length) {
      print('Invalid current track index: $currentTrackIndex');
      return;
    }
    currentTrackIndex = (currentTrackIndex + 1) % trackList.length;
    print('Skipping to next track, new index: $currentTrackIndex');
    playSong(trackList[currentTrackIndex]);
  }

  void skipPrevious() {
    if (currentTrackIndex > 0) {
      currentTrackIndex--;
      print('Skipping to previous track, new index: $currentTrackIndex');
      playSong(trackList[currentTrackIndex]);
    } else {
      print("There is no previous track.");
    }
  }

  void playNextTrack() {
    if (isRepeat) {
      print('Repeating current track');
      playSong(trackList[currentTrackIndex]);
    } else {
      skipNext();
    }
  }

  void repeatSong() async {
    // Toggle the repeat mode
    isRepeat = !isRepeat;

    // Debugging information
    print('Repeat mode is ${isRepeat ? 'ON' : 'OFF'}');

    // Check if repeat mode is enabled
    if (isRepeat) {
      // If the song is currently playing, stop it
      if (isPlaying) {
        _audioPlayer.stop(); // Stop current playback
        print('Song stopped for repeat');

        // Restart playback from the beginning
        if (currentTrackIndex >= 0 && currentTrackIndex < trackList.length) {
          String trackId = trackList[currentTrackIndex];
          final url = Uri.parse('$_baseUrl$_endpoint/?ids=$trackId');

          try {
            var response = await http.get(
              url,
              headers: {
                'x-rapidapi-host': 'spotify23.p.rapidapi.com',
                'x-rapidapi-key': _apiKey,
              },
            );

            if (response.statusCode == 200) {
              var jsonResponse = jsonDecode(response.body);
              var trackData = jsonResponse['tracks'][0];
              var audioUrl = trackData['preview_url'];

              if (audioUrl != null && audioUrl.isNotEmpty) {
                await _audioPlayer
                    .play(UrlSource(audioUrl)); // Restart playback
                print('Playing song: $trackId from the beginning');
              } else {
                print('Error: Audio URL is empty or null');
              }
            } else {
              print('Error fetching track details: ${response.statusCode}');
            }
          } catch (e) {
            print('Error: $e');
          }
        }
      }
    }

    // Notify listeners about the change
    notifyListeners();
  }

  void addToPlaylist() {
    isAdded = !isAdded;
    notifyListeners();
  }

  Future<void> fetchTrackId(String trackName, String artists) async {
    final url = Uri.parse(
        '$_baseUrl/search/?q=track:$trackName%20artist:$artists&type=track&limit=1');
    try {
      var response = await http.get(
        url,
        headers: {
          'x-rapidapi-host': 'spotify23.p.rapidapi.com',
          'x-rapidapi-key': _apiKey,
        },
      );

      print('Fetching track ID...');
      print('URL: $url');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Parsed JSON Response: $jsonResponse');

        var trackItems = jsonResponse['tracks']['items'];
        if (trackItems.isNotEmpty) {
          var trackId = trackItems[0]['id'];
          if (trackId != null && trackId.isNotEmpty) {
            trackIds.add(trackId);
            print('Track ID Added: $trackId');
            notifyListeners();
          } else {
            print('Error: Track ID is empty or null');
          }
        } else {
          print('Error: No tracks found in the response');
        }
      } else {
        print('Error fetching track ID: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void setTrackList(List<String> tracks) {
    trackList = tracks;
    print('Track list set with .................${tracks.length} tracks');
    notifyListeners();
  }
}
