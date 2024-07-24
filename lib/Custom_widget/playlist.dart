import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';

// Define a data model for the playlist items
class PlaylistItem {
  final String imagePath;
  final String trackName;
  final String artistName;

  PlaylistItem({
    required this.imagePath,
    required this.trackName,
    required this.artistName,
  });
}

class MusicPlayList extends StatelessWidget {
   MusicPlayList({
    super.key,
  });

  // List of playlist items with example data
  final List<PlaylistItem> playlistItems =  [
    PlaylistItem(
      imagePath: "assets/Image/Image11.jpg",
      trackName: "Today's Top Hits",
      artistName: "Drake",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image12.jpg",
      trackName: "RapCaviar",
      artistName: "Taylor Swift",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image13.jpg",
      trackName: "Rock Classics",
      artistName: "Ed Sheeran",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image14.jpg",
      trackName: "Hot Country",
      artistName: "Various Artists",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image15.jpg",
      trackName: "New Music Friday",
      artistName: "Beyoncé",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image16.jpg",
      trackName: "Peaceful Piano",
      artistName: "Billie Eilish",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image17.jpg",
      trackName: "Beast Mode",
      artistName: "Post Malone",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image18.jpg",
      trackName: "Chill Hits",
      artistName: "Ariana Grande",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image19.jpg",
      trackName: "Viva Latino",
      artistName: "The Weeknd",
    ),
    PlaylistItem(
      imagePath: "assets/Image/Image20.jpg",
      trackName: "Dance Party",
      artistName: "Kanye West",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: playlistItems.length,
        itemBuilder: (context, index) {
          final item = playlistItems[index];
          return Library(
            imagePath: item.imagePath,
            trackName: item.trackName,
            artistName: item.artistName,
          );
        },
      ),
    );
  }
}

class Library extends StatelessWidget {
  final String imagePath;
  final String trackName;
  final String artistName;

  const Library({
    super.key,
    required this.imagePath,
    required this.trackName,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image(
            height: 180,
            width: 160,
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            trackName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: "Avenir_bold"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            artistName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontFamily: "Avenir_bold"),
          ),
        ),
      ],
    );
  }
}
