import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/home/music.dart';
import 'package:spotify_clone/views/miniplayer/miniplayer.dart';
import 'package:spotify_clone/views/musicplayer/musicplayer.dart';

class Musiclist extends StatefulWidget {
  const Musiclist({super.key});

  @override
  State<Musiclist> createState() => _MusiclistState();
}

class _MusiclistState extends State<Musiclist> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarclr,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 430,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 52, 160, 210),
                    Color.fromARGB(147, 27, 27, 27)
                  ])),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: txtclr,
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(185, 22, 21, 21)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 20,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Image(
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/Image/Yuvan.jpg"),
                          ),
                        ),
                      ],
                    ),
                    kheight,
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Yuavn Shankar Raja",
                        style: TextStyle(
                            color: txtclr,
                            fontFamily: "Avenir_bold",
                            fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 17,
                                  backgroundColor:
                                      Color.fromARGB(255, 52, 225, 58),
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                        color: txtclr,
                                        fontFamily: "Avenir_med",
                                        fontSize: 15),
                                  ),
                                ),
                                swidth,
                                Center(
                                  child: Text(
                                    "Syed Moahamed Afsal",
                                    style: TextStyle(
                                      color: txtclr,
                                      fontFamily: "Avenir_bold",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: txtclr,
                            size: 30,
                          ),
                        ),
                        swidth,
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_add_alt,
                            color: txtclr,
                            size: 30,
                          ),
                        ),
                        swidth,
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            color: txtclr,
                            size: 30,
                          ),
                        ),
                        swidth,
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert_outlined,
                            color: txtclr,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shuffle,
                            color: txtclr,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle_fill,
                            color: mjrclr,
                            size: 50,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SongScreen(),));
                    },
                    child: Row(
                      children: [
                        const Image(
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/Image/Yuvan.jpg"),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Liked Song",
                              style: TextStyle(
                                color: txtclr,
                                fontFamily: "Avenir_med",
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Yuvan Shankar Raja",
                              style: TextStyle(
                                color: txtclr,
                                fontFamily: "Avenir_med",
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert_outlined,
                              color: txtclr,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
