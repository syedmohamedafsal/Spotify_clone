import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/playlist/songs.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool _isListView = true; // Default to list view

  void _toggleViewMode() {
    setState(() {
      _isListView = !_isListView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarclr,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Sort by",
                                style: TextStyle(
                                  color: txtclr,
                                  fontFamily: "Avenir_med",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Divider(
                              color: appBarclr,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Recents",
                                style: TextStyle(
                                  color: txtclr,
                                  fontFamily: "Avenir_reg",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Recently added",
                                style: TextStyle(
                                  color: txtclr,
                                  fontFamily: "Avenir_reg",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Alphabetical",
                                style: TextStyle(
                                  color: txtclr,
                                  fontFamily: "Avenir_reg",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Creator",
                                style: TextStyle(
                                  color: txtclr,
                                  fontFamily: "Avenir_reg",
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      _isListView
                          ? Icons.arrow_upward_outlined
                          : Icons.arrow_upward_outlined,
                      color: txtclr,
                      size: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 7),
                      child: Text(
                        _isListView ? "Recent" : "Recent",
                        style: const TextStyle(
                          color: txtclr,
                          fontFamily: "Avenir_reg",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isListView = !_isListView;
                  });
                },
                icon: Icon(
                  _isListView
                      ? Icons.format_list_bulleted_outlined
                      : Icons.grid_view,
                  color: txtclr,
                  size: 25,
                ),
              ),
            ],
          ),
          Expanded(
            child: _isListView
                ? ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Musiclist(),));
                          },
                          child: const Row(
                            children: [
                              Image(
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                image: AssetImage("assets/Image/Yuvan.jpg"),
                              ),
                              SizedBox(width: 10),
                              Column(
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
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 50/60,
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Musiclist(),));
                        },
                        child: Container(
                          height: 200, // Adjust the height as needed
                          width: 200, // Adjust the width as needed
                          decoration: BoxDecoration(
                            color: backgrndclr,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image(
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: double
                                      .infinity, // Expand to fit the container
                                  image: AssetImage("assets/Image/Yuvan.jpg"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 1,top:5),
                                child: Text(
                                  "Yuvan Shankar Raja", // Example text
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: txtclr,
                                    fontFamily: "Avenir_med",
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Playlist", // Example text
                                    style: TextStyle(
                                      color: txtclr,
                                      fontFamily: "Avenir_med",
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
