import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';

class MusicPlayList extends StatelessWidget {
  const MusicPlayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Library();
        },
      ),
    );
  }
}

class Library extends StatelessWidget {
  const Library({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Image(
            height: 180,
            width: 160,
            fit: BoxFit.cover,
            image: AssetImage("assets/Image/Yuvan.jpg"),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Yuvan Drugs",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: "Avenir_bold"),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "Yuvan Shankar Raja",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontFamily: "Avenir_bold"),
          ),
        ),
      ],
    );
  }
}
