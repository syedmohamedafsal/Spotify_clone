import 'package:flutter/material.dart';
import 'package:spotify_clone/controller/albumprovider.dart';
import 'package:spotify_clone/model/album.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/musicplayer/musicplayer.dart';

class Musiclist extends StatefulWidget {
  const Musiclist({super.key});

  @override
  State<Musiclist> createState() => _MusiclistState();
}

class _MusiclistState extends State<Musiclist> {
  final AlbumProvider albumProvider = AlbumProvider();
  final String albumIds = '3IBcauSj5M2A6lTeffJzdv';
  Future<Album?>? albumFuture;

  @override
  void initState() {
    super.initState();
    albumFuture = albumProvider.fetchAlbum(albumIds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarclr,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<Album?>(
              future: albumFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final album = snapshot.data!;
                  return Column(
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
                                          color: const Color.fromARGB(
                                                  185, 22, 21, 21)
                                              .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 20,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Image.network(
                                      album.images[0].url,
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              kheight,
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  album.name,
                                  style: const TextStyle(
                                      color: txtclr,
                                      fontFamily: "Avenir_bold",
                                      fontSize: 20),
                                ),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 17,
                                            backgroundColor: Color.fromARGB(
                                                255, 52, 225, 58),
                                            child: Text(
                                              album.artists[0].name[0],
                                              style: TextStyle(
                                                  color: txtclr,
                                                  fontFamily: "Avenir_med",
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Center(
                                            child: Text(
                                              album.artists[0].name,
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
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.person_add_alt,
                                      color: txtclr,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: txtclr,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10),
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
                        itemCount: album.tracks.length,
                        itemBuilder: (context, index) {
                          final track = album.tracks[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongScreen(
                                      trackName: track.name,
                                      artists: album.artists[0].name,
                                      albumImageUrl: album.images[0].url,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.network(
                                    album.images[0].url,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        track.name,
                                        style: TextStyle(
                                          color: txtclr,
                                          fontFamily: "Avenir_med",
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        album.artists[0].name,
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                } else {
                  return Center(child: Text('No album data found.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
