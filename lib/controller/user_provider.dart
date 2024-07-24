import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_clone/model/user_model.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  String baseUrl = 'https://spotify81.p.rapidapi.com';
  String userEndpoint = '/user_profile';
  String apiKey = '9576b5b51fmsh20aed4fed746533p1a3df7jsnefd5018d202f';
  String host = 'spotify81.p.rapidapi.com';

  UserModel _user = UserModel(); // Default empty UserModel
  bool _isLoading = false;

  UserModel get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchUserData(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('$baseUrl$userEndpoint?id=$userId&playlistLimit=10&artistLimit=10');
      print('Fetching data from URL: $url');
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': host,
        },
      );
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _user = UserModel.fromJson(data);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Methods to update user data
  void updateUser(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }

  void updateUserField({
    String? uri,
    String? name,
    String? imageUrl,
    int? followersCount,
    int? followingCount,
    List<RecentlyPlayedArtists>? recentlyPlayedArtists,
    List<PublicPlaylists>? publicPlaylists,
    int? totalPublicPlaylistsCount,
    bool? hasSpotifyImage,
    int? color,
    bool? allowFollows,
    bool? showFollows,
  }) {
    _user = _user.copyWith(
      uri: uri,
      name: name, 
      imageUrl: imageUrl,
      followersCount: followersCount,
      followingCount: followingCount,
      recentlyPlayedArtists: recentlyPlayedArtists,
      publicPlaylists: publicPlaylists,
      totalPublicPlaylistsCount: totalPublicPlaylistsCount,
      hasSpotifyImage: hasSpotifyImage,
      color: color,
      allowFollows: allowFollows,
      showFollows: showFollows,
    );
    notifyListeners();
  }
}
