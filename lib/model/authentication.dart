import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthProvider with ChangeNotifier {
  final String clientId = 'YOUR_CLIENT_ID'; // Replace with your actual client ID
  final String redirectUri = 'http://localhost:8888/callback'; // Replace with your actual redirect URI
  String? _authCode;

  String? get authCode => _authCode;

  String generateRandomString(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random.secure();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join('');
  }

  Future<void> login() async {
    final state = generateRandomString(16);
    final scope = 'user-read-private user-read-email';
    final url = Uri.https('accounts.spotify.com', '/authorize', {
      'response_type': 'code',
      'client_id': clientId,
      'scope': scope,
      'redirect_uri': redirectUri,
      'state': state,
    });

    try {
      if (await canLaunchUrl(url.toString() as Uri)) {
        await launchUrl(url.toString() as Uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  void handleRedirect(String url) {
    final uri = Uri.parse(url);
    final code = uri.queryParameters['code'];
    if (code != null) {
      _authCode = code;
      notifyListeners();
    }
  }
}
