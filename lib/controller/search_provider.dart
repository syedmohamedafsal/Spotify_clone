import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spotify_clone/model/search_model.dart' as custom_model;

class SearchProvider with ChangeNotifier {
  List<custom_model.Data> _searchResults = [];
  bool _isLoading = false;

  List<custom_model.Data> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  Future<void> fetchSearchResults(String query) async {
    _isLoading = true;
    notifyListeners();

    final url =
        'https://spotify81.p.rapidapi.com/search?q=${Uri.encodeComponent(query)}&type=multi&offset=0&limit=10&numberOfTopResults=5';
    int retryCount = 0;
    const int maxRetries = 5;

    while (retryCount < maxRetries) {
      try {
        final response = await http.get(
          Uri.parse(url),
          headers: {
            'X-RapidAPI-Key':
                '9576b5b51fmsh20aed4fed746533p1a3df7jsnefd5018d202f', // Replace with your actual API key
            'X-RapidAPI-Host': 'spotify81.p.rapidapi.com',
          },
        );

        print('Request URL: $url');
        print('Response Status Code: ${response.statusCode}');
        print('Response Headers: ${response.headers}');
        print('API Response: ${response.body}');

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          print('Parsed Data: $data');

          if (data.containsKey('albums') &&
              data['albums'] is Map<String, dynamic>) {
            final albumsMap = data['albums'] as Map<String, dynamic>;
            print('Albums Map: $albumsMap');

            if (albumsMap.containsKey('items') && albumsMap['items'] is List) {
              final searchResults = albumsMap['items'] as List<dynamic>?;
              print('Search Results: $searchResults');

              if (searchResults != null && searchResults.isNotEmpty) {
                _searchResults = custom_model.Data.fromList(
                  searchResults.map((e) => e as Map<String, dynamic>).toList(),
                );
              } else {
                print('No search results found for query: $query.');
                _searchResults = [];
              }
            } else {
              print('Key "items" not found or not a List in albums.');
              _searchResults = [];
            }
          } else {
            print('Key "albums" not found or not a Map in response.');
            _searchResults = [];
          }
        } else if (response.statusCode == 429) {
          retryCount++;
          final waitTime =
              (2 << retryCount) * 1000; // Bitwise shift to get 2^retryCount
          print('Rate limit exceeded. Retrying in $waitTime milliseconds...');
          await Future.delayed(Duration(milliseconds: waitTime));
        } else if (response.statusCode == 500) {
          retryCount++;
          final waitTime =
              (2 << retryCount) * 1000; // Bitwise shift to get 2^retryCount
          print('Server error. Retrying in $waitTime milliseconds...');
          await Future.delayed(Duration(milliseconds: waitTime));
        } else {
          print('Unexpected status code: ${response.statusCode}');
          _searchResults = [];
          break;
        }
      } catch (error) {
        print('Fetch Error: $error');
        _searchResults = [];
        break;
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }
}
