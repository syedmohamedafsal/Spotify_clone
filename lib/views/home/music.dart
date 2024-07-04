import 'package:flutter/material.dart';
import 'package:spotify_clone/Custom_widget/playlisttxt.dart';
import 'package:spotify_clone/const/const_clr.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarclr,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.8,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 70,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: backgrndclr,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                child: Image(
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    "assets/Image/Yuvan.jpg",
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Playlist",
                              style: TextStyle(
                                  fontFamily: "Avenir_med",
                                  fontSize: 20,
                                  color: txtclr),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                kheight,
                const PlayListtxt(
                  playlistheading: 'Charts',
                ),
                const PlayListtxt(
                  playlistheading: 'Recently played',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}