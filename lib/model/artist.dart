import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class ArtistProvider with ChangeNotifier {
  final String _baseUrl = 'https://spotify23.p.rapidapi.com';
  final String _endpoint = '/artists';
  final String _apiKey = '9576b5b51fmsh20aed4fed746533p1a3df7jsnefd5018d202f'; // Replace with your actual RapidAPI key

  List<Map<String, dynamic>> artistData = [];
  List<String> _selectedData = [];
  bool _isLoading = false;

  List<String> get selectedData => _selectedData;
  bool get isLoading => _isLoading;

  Future<void> fetchArtists(String ids) async {
    _setLoadingState(true);

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
        final dynamic jsonData = jsonDecode(response.body);
        print('API Response: $jsonData'); // Debugging line

        if (jsonData != null && jsonData.containsKey('artists')) {
          final List<dynamic> artists = jsonData['artists'];
          artistData = artists
              .map((artist) => {
                    'imageUrl': artist['images'] != null && artist['images'].isNotEmpty
                        ? artist['images'][0]['url']
                        : 'default_image_url_here', // Provide a default image URL if no images are available
                    'name': artist['name'],
                  })
              .toList();
          _notifyListeners();
        } else {
          debugPrint('No artists found in the API response');
        }
      } else {
        debugPrint('Failed to fetch artists: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error fetching artists: $e');
    } finally {
      _setLoadingState(false);
    }
  }

  void _setLoadingState(bool state) {
    _isLoading = state;
    _notifyListeners();
  }

  void _notifyListeners() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void addToSelectedData(String name) {
    _selectedData.add(name);
    _notifyListeners();
  }

  void removeFromSelectedData(String name) {
    _selectedData.remove(name);
    _notifyListeners();
  }
}
