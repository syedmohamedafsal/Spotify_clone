import 'package:flutter/material.dart';
import 'package:spotify_clone/Custom_widget/playlisttxt.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/playlist/songs.dart';

// Define PlaylistItem class
class PlaylistItem {
  final String imagePath;
  final String trackName;

  PlaylistItem({required this.imagePath, required this.trackName});
}

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final List<PlaylistItem> playlistItems = [
    PlaylistItem(imagePath: "assets/Image/image1.jpg", trackName: "Liked Songs"),
    PlaylistItem(imagePath: "assets/Image/Image2.jpg", trackName: "MJS"),
    PlaylistItem(imagePath: "assets/Image/Image3.jpg", trackName: "David Playlist"),
    PlaylistItem(imagePath: "assets/Image/Image4.jpg", trackName: "Kenney's love"),
    PlaylistItem(imagePath: "assets/Image/Image5.jpg", trackName: "Guitar Only"),
    PlaylistItem(imagePath: "assets/Image/Image6.jpg", trackName: "Tayloressss"),
    PlaylistItem(imagePath: "assets/Image/Image7.jpg", trackName: "Love From heart"),
    PlaylistItem(imagePath: "assets/Image/Image8.jpg", trackName: "Melody"),
  ];

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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.8,
                    ),
                    itemCount: playlistItems.length,
                    itemBuilder: (context, index) {
                      final item = playlistItems[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Musiclist(),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 70,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: backgrndclr,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.fill,
                                    image: AssetImage(item.imagePath),
                                  ),
                                ),
                              ),
                              Text(
                                item.trackName,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontFamily: "Avenir_med",
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: txtclr),
                              ),
                            ],
                          ),
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
                const PlayListtxt(
                  playlistheading: 'Podcast',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
