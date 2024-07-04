import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/artistcheck.dart';
import 'package:spotify_clone/views/home/home.dart';

// ignore: unused_element
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
  // Simulating API data
  final List<Map<String, String>> artistData = List.generate(
      20,
      (index) => {
            'imageUrl': 'assets/Image/Yuvan.jpg',
            'name': 'Yuvan $index',
          });

  @override
  Widget build(BuildContext context) {
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
      body: Stack(children: [
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
              child: GridView.builder(
                padding: const EdgeInsets.all(15.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1, // Aspect ratio of the items
                ),
                itemCount: artistData.length,
                itemBuilder: (context, index) {
                  return CheckableCircleAvatar(
                    imageUrl: artistData[index]['imageUrl']!,
                    name: artistData[index]['name']!,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<ArtistProvider>(
                builder: (context, artistProvider, _) => TextButton(
                  onPressed: () {
                    if (artistProvider.selectedData.length >= 3) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeScreen()),
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
            ),
          ],
        ),
      ]),
    );
  }
}

class CheckableCircleAvatar extends StatefulWidget {
  final String imageUrl;
  final String name;

  CheckableCircleAvatar({
    required this.imageUrl,
    required this.name,
  });

  @override
  _CheckableCircleAvatarState createState() => _CheckableCircleAvatarState();
}

class _CheckableCircleAvatarState extends State<CheckableCircleAvatar> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Access the selectedData list from the ArtistProvider using Provider.of
        final artistProvider =
            Provider.of<ArtistProvider>(context, listen: false);

        setState(() {
          isChecked = !isChecked;

          // Update selectedData based on the isChecked state
          if (isChecked) {
            artistProvider.addToSelectedData(widget.name);
          } else {
            artistProvider.removeFromSelectedData(widget.name);
          }
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                maxRadius: 40,
                backgroundImage: AssetImage(widget.imageUrl),
                backgroundColor: isChecked ? Colors.green : null,
              ),
              if (isChecked)
                Positioned(
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
            widget.name,
            style: TextStyle(
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
