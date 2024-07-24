import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/controller/miniplayerstate.dart';
import 'package:spotify_clone/controller/passwordcont.dart';
import 'package:spotify_clone/controller/search_provider.dart';
import 'package:spotify_clone/controller/songscreen.dart';
import 'package:spotify_clone/controller/user_provider.dart';
import 'package:spotify_clone/model/artist.dart';
import 'package:spotify_clone/model/authentication.dart';
import 'package:spotify_clone/views/Authentication/login.dart';
import 'package:spotify_clone/views/home/home.dart';

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
        ChangeNotifierProvider(create: (_) => MiniPlayerModel()),
        ChangeNotifierProvider(create: (_) => SongScreenProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: const MaterialApp(
        home: HomeScreen(), // Example of navigating to the login screen
      ),
    );
  }
}
