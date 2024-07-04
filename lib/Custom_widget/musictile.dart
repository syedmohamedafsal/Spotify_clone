import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/Custom_widget/playlist.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/musictileprovider.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.4,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 70,
                  width: 195,
                  decoration: BoxDecoration(
                    color: backgrndclr,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: Image(
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                            image: AssetImage("assets/Image/Yuvan.jpg"),
                          ),
                        ),
                      ),
                      Text(
                        "Playlist",
                        style: TextStyle(
                          fontFamily: "Avenir_med",
                          fontSize: 20,
                          color: txtclr,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
  }
}
