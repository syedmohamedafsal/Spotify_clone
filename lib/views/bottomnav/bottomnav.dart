import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen(
      {super.key, required this.selectedindex, required this.onTap});
  final int selectedindex;
  final ValueChanged<int> onTap;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedindex,
      onTap: widget.onTap,
      backgroundColor: appBarclr,
      selectedItemColor: Colors
          .white, // Change this to your desired color for the selected item
      unselectedItemColor: Colors
          .grey, // Change this to your desired color for the unselected items
      items: [
        BottomNavigationBarItem(
            label: "Home",
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: widget.selectedindex == 0 ? 40 : 30,
              height: widget.selectedindex == 0 ? 40 : 30,
              child: Icon(
                widget.selectedindex == 0
                    ? Icons.home_filled
                    : Icons.home_outlined,
              ),
            ),
            backgroundColor: backgrndclr),
        BottomNavigationBarItem(
            label: "Search",
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: widget.selectedindex == 1 ? 40 : 30,
              height: widget.selectedindex == 1 ? 40 : 30,
              child: Icon(
                widget.selectedindex == 1
                    ? Icons.saved_search_rounded
                    : Icons.search_rounded, 
              ),
            ),
            backgroundColor: backgrndclr),
        BottomNavigationBarItem(
            label: "Your Library",
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: widget.selectedindex == 2 ? 40 : 30,
              height: widget.selectedindex == 2 ? 40 : 30,
              child: Icon(
                widget.selectedindex == 2
                    ? Icons.library_music
                    : Icons.library_music_outlined,
              ),
            ),
            backgroundColor: backgrndclr),
      ],
    );
  }
}
