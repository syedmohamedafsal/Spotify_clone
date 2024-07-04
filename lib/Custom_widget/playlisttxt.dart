import 'package:flutter/material.dart';
import 'package:spotify_clone/Custom_widget/playlist.dart';
import 'package:spotify_clone/const/const_clr.dart';

class PlayListtxt extends StatelessWidget {
  final String playlistheading;
  const PlayListtxt({
    super.key,
    required this.playlistheading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              playlistheading,
              style: const TextStyle(
                color: txtclr,
                fontFamily: "Avenir_bold",
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27, // Adjust height as needed
            child: const MusicPlayList(),
          ),
          kheight,
        ],
      ),
    );
  }
}
