import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spotify_clone/model/trackmodel.dart';

class SongScreenProvider with ChangeNotifier {
  
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  Track? currentTrack;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final String _baseUrl = 'https://spotify23.p.rapidapi.com';
  final String _endpoint = '/tracks';
  final String _apiKey = '9576b5b51fmsh20aed4fed746533p1a3df7jsnefd5018d202f';

  SongScreenProvider() {
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      currentPosition = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        isPlaying = false;
        notifyListeners();
      }
    });
  }

  Future<void> playSong(String ids) async {
    final url = Uri.parse('$_baseUrl$_endpoint/?ids=$ids');
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
        var audioUrl = jsonResponse['tracks'][0]['audio_url']; // Adjust this based on your API response structure
        if (audioUrl != null && audioUrl.isNotEmpty) {
          await _audioPlayer.play(UrlSource(audioUrl));
          isPlaying = true;
          notifyListeners();
        } else {
          print('Error: Audio URL is empty or null');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> pauseSong() async {
    await _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  Future<void> resumeSong() async {
    await _audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }

  void skipPrevious() {
    // Add your API call here to skip to the previous song
    notifyListeners();
  }

  void skipNext() {
    // Add your API call here to skip to the next song
    notifyListeners();
  }

  void shuffleSongs() {
    isShuffle = !isShuffle;
    notifyListeners();
    // Add your logic here to handle shuffle
  }

  void repeatSong() {
    isRepeat = !isRepeat;
    notifyListeners();
    // Add your logic here to handle repeat
  }

  void addToPlaylist() {
    // Add your logic here to handle adding to playlist
    notifyListeners();
  }

  void seekTo(Duration position) {
    _audioPlayer.seek(position);
    currentPosition = position;
    notifyListeners();
  }

  void setTrack(Track track) {
    currentTrack = track;
    notifyListeners();
  }
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

}
