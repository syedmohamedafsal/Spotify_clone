import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/views/bottomnav/bottomnav.dart';
import 'package:spotify_clone/views/home/all.dart';
import 'package:spotify_clone/views/home/music.dart';
import 'package:spotify_clone/views/miniplayer/miniplayer.dart';
import 'package:spotify_clone/views/search/search.dart';
import 'package:spotify_clone/views/your_library/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _setPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 40),
      child: Scaffold(
        backgroundColor: backgrndclr,
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(97, 0, 0, 0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage("assets/Image/Yuvan.jpg"),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Yuvan Shankar Raja",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Avenir_bold"),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "View profile",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontFamily: "Avenir_bold"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.bolt_outlined,
                  color: Colors.white,
                  size: 35,
                ),
                title: Text(
                  "What's new",
                  style: TextStyle(color: Colors.white, fontFamily: "Avenir_bold"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 35,
                ),
                title: Text(
                  'Listening history',
                  style: TextStyle(color: Colors.white, fontFamily: "Avenir_bold"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 35,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontFamily: "Avenir_bold"),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: appBarclr,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const CircleAvatar(
                  backgroundColor: mjrclr,
                  child: Text(
                    "S",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Avenir_bold"),
                  ),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (_selectedIndex == 0) ...[
                TextButton(
                  onPressed: () {
                    _setPageIndex(0);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith<Color>((states) {
                      return _currentPageIndex == 0
                          ? mjrclr
                          : const Color.fromARGB(47, 158, 158, 158);
                    }),
                  ),
                  child: Text(
                    "All",
                    style: TextStyle(
                        color:
                            _currentPageIndex == 0 ? Colors.black : Colors.white,
                        fontFamily: "Avenir_bold"),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    _setPageIndex(1);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith<Color>((states) {
                      return _currentPageIndex == 1
                          ? mjrclr
                          : const Color.fromARGB(47, 158, 158, 158);
                    }),
                  ),
                  child: Text(
                    "Music",
                    style: TextStyle(
                        color: _currentPageIndex == 1 ? Colors.black : Colors.white,
                        fontFamily: "Avenir_bold"),
                  ),
                ),
              ],
              if (_selectedIndex == 1) ...[
                const Text(
                    "Search",
                    style: TextStyle(
                        color:txtclr,
                        fontFamily: "Avenir_bold"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 202),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt_outlined,color: txtclr,size: 30,)),
                  )
              ],
              if (_selectedIndex == 2) ...[
                const Text(
                    "Your Library",
                    style: TextStyle(
                        color:txtclr,
                        fontFamily: "Avenir_bold"),
                  ),
                  const Spacer(),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: txtclr,size: 30,))
                  ),

                   Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.add,color: txtclr,size: 30,)),
                  )
              ],
            ],
          ),
        ),
        body: _selectedIndex == 0
            ? PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: const [
                  AllScreen(),
                  AllScreen(),
                ],
              )
            : _selectedIndex == 1
                ? const SearchScreen()
                : const LibraryScreen(),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MiniPlayer(),
            BottomNavScreen(
              selectedindex: _selectedIndex,
              onTap: _onBottomNavTap,
            ),
          ],
        ),
      ),
    );
  }
}
