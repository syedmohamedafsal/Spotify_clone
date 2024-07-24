import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      backgroundColor: appBarclr,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'What song do you want?',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Avenir_med",
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  searchProvider.fetchSearchResults(value);
                }
              },
            ),
          ),
          if (searchProvider.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (searchProvider.searchResults.isEmpty)
            const Center(child: Text('No results found'))
          else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: searchProvider.searchResults.length,
                  itemBuilder: (context, index) {
                    final result = searchProvider.searchResults[index];
                    final coverArtUrl =
                        result.albumOfTrack?.coverArt?.sources?.first.url ?? '';
                    final artistName =
                        result.artists?.items?.first.profile?.name ??
                            'Unknown Artist';
                    final trackName = result.name ?? 'Unknown Track';

                    print(
                        'Cover Art URL: $coverArtUrl'); // Log the URL to check
                    print('track name: $trackName');
                    print('artistName: $artistName');
                    return ListTile(
                      leading: coverArtUrl.isNotEmpty &&
                              coverArtUrl.startsWith('http')
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(coverArtUrl),
                              radius: 30,
                              onBackgroundImageError: (exception, stackTrace) {
                                print(
                                    'Image load error: $exception'); // Log image load error
                              },
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/Image/Yuvan.jpg'),
                              radius: 30,
                            ),
                      title: Text(
                        '$trackName\n$artistName',
                        style: const TextStyle(
                          color: txtclr,
                          fontSize: 18,
                          fontFamily: "Avenir_med",
                        ),
                      ),
                      onTap: () {
                        print('Selected track: $trackName');
                        // Uncomment the below lines and update the parameters as needed
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SongScreen(
                        //       trackName: trackName,
                        //       coverArtUrl: coverArtUrl,
                        //       artistName: artistName, // Pass artist name if needed
                        //       // Add any other parameters required by SongScreen
                        //     ),
                        //   ),
                        // );
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
