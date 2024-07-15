import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/const/const_clr.dart'; // Assuming you have defined your constants here
import 'package:spotify_clone/model/artist.dart';
import 'package:spotify_clone/views/home/home.dart'; // Import your ArtistProvider class

class _ArtistStates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArtistProvider(),
      child: const Artist(),
    );
  }
}

class Artist extends StatefulWidget {
  const Artist({super.key});

  @override
  State<Artist> createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget initializes
    Provider.of<ArtistProvider>(context, listen: false).fetchArtists('artist_ids_here');
  }

  @override
  Widget build(BuildContext context) {
    final artistProvider = Provider.of<ArtistProvider>(context);

    return Scaffold(
      backgroundColor: backgrndclr,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: txtclr,
        ),
        backgroundColor: appBarclr,
        centerTitle: true,
        title: const Text(
          "Choose 3 or more artists you like",
          style: TextStyle(
              color: txtclr,
              fontSize: 20,
              fontFamily: "Avenir_bold",
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Avenir_med"),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                    // Handle search query changes
                    print('Search query: $value');
                  },
                ),
              ),
              Expanded(
                child: artistProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        padding: const EdgeInsets.all(15.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1, // Aspect ratio of the items
                        ),
                        itemCount: artistProvider.artistData.length,
                        itemBuilder: (context, index) {
                          return CheckableCircleAvatar(
                            imageUrl: artistProvider.artistData[index]['imageUrl'],
                            name: artistProvider.artistData[index]['name'],
                          );
                        },
                      ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (artistProvider.selectedData.length >= 3) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please choose 3 or more artists"),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Avenir_bold",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckableCircleAvatar extends StatefulWidget {
  final String? imageUrl;
  final String? name;

  const CheckableCircleAvatar({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  _CheckableCircleAvatarState createState() => _CheckableCircleAvatarState();
}

class _CheckableCircleAvatarState extends State<CheckableCircleAvatar> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final artistProvider =
            Provider.of<ArtistProvider>(context, listen: false);

        setState(() {
          isChecked = !isChecked;

          if (isChecked) {
            artistProvider.addToSelectedData(widget.name!);
          } else {
            artistProvider.removeFromSelectedData(widget.name!);
          }
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                maxRadius: 40,
                backgroundImage: widget.imageUrl != null ? NetworkImage(widget.imageUrl!) : null,
                backgroundColor: isChecked ? Colors.green : null,
                child: widget.imageUrl == null ? Icon(Icons.person, size: 40) : null,
              ),
              if (isChecked)
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            widget.name ?? 'Unknown',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Avenir_med",
            ),
          ),
        ],
      ),
    );
  }
}
