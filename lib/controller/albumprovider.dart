import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spotify_clone/model/album.dart';

import 'package:http/http.dart' as http;
class AlbumProvider with ChangeNotifier {
  final String _baseUrl = 'https://spotify23.p.rapidapi.com';
  final String _endpoint = '/albums';
  final String _apiKey = '9576b5b51fmsh20aed4fed746533p1a3df7jsnefd5018d202f';

  Future<Album?> fetchAlbum(String ids) async {
    final url = Uri.parse('$_baseUrl$_endpoint/?ids=$ids');

    try {
      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-host': 'spotify23.p.rapidapi.com',
          'x-rapidapi-key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)['albums'][0];
        return Album.fromJson(json);
      } else {
        debugPrint('Failed to fetch album: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching album: $e');
      return null;
    }
  }
}