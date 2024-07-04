import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/controller/artistcheck.dart';
import 'package:spotify_clone/controller/miniplayerstate.dart';
import 'package:spotify_clone/controller/passwordcont.dart';
import 'package:spotify_clone/model/authentication.dart';
import 'package:spotify_clone/views/Authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArtistProvider()),
        ChangeNotifierProvider(create: (_) => MiniPlayerModel()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PasswordSuffixIconState()),
      ],
      child: const MaterialApp(
        home: Login(), // Example of navigating to the login screen
      ),
    );
  }
}
