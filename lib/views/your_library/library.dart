import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/controller/user_provider.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/playlist/songs.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool _isListView = true; // Default to list view

  @override
  void initState() {
    super.initState();
    // Fetch user data with a valid userId
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider
          .fetchUserData('nocopyrightsounds'); // Replace with valid userId
    });
  }

  void _toggleViewMode() {
    setState(() {
      _isListView = !_isListView;
    });
  }

  bool _isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasAbsolutePath && uri.host.isNotEmpty;
  }

  String _convertSpotifyUriToUrl(String uri) {
    if (uri.startsWith("spotify:image:")) {
      return "https://i.scdn.co/image/${uri.split(':').last}";
    }
    return uri;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

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
                onPressed: _toggleViewMode,
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
            child: userProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : _isListView
                    ? ListView.builder(
                        itemCount: user.publicPlaylists?.length ?? 0,
                        itemBuilder: (context, index) {
                          final playlist = user.publicPlaylists?[index];
                          final imageUrl =
                              _convertSpotifyUriToUrl(playlist?.imageUrl ?? '');
                          print("Image URL: $imageUrl"); // Log the image URL
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Musiclist(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  _isValidImageUrl(imageUrl)
                                      ? Image.network(
                                          imageUrl,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/Image/default.jpg', // Default image path
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                      : Image.asset(
                                          'assets/Image/Yuvan.jpg', // Default image path
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          playlist?.name ?? "Unknown Playlist",
                                          style: TextStyle(
                                            color: txtclr,
                                            fontFamily: "Avenir_med",
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          playlist?.ownerName ??
                                              "Unknown Owner",
                                          style: TextStyle(
                                            color: txtclr,
                                            fontFamily: "Avenir_med",
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 50 / 60,
                          mainAxisSpacing: 30.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: user?.publicPlaylists?.length ?? 0,
                        itemBuilder: (context, index) {
                          final playlist = user?.publicPlaylists?[index];
                          final imageUrl =
                              _convertSpotifyUriToUrl(playlist?.imageUrl ?? '');
                          print("Image URL: $imageUrl"); // Log the image URL
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Musiclist(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                _isValidImageUrl(imageUrl)
                                    ? Image.network(
                                        imageUrl,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/Image/Yuvan.jpg', // Default image path
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        'assets/Image/Yuvan.jpg', // Default image path
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                SizedBox(height: 10),
                                Flexible(
                                  child: Text(
                                    playlist?.name ?? "Unknown Playlist",
                                    style: TextStyle(
                                      color: txtclr,
                                      fontFamily: "Avenir_med",
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
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
