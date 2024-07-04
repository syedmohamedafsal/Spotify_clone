import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/miniplayerstate.dart';
import 'package:spotify_clone/views/musicplayer/musicplayer.dart';

// ignore: must_be_immutable
class MiniPlayer extends StatefulWidget {
  
   MiniPlayer({super.key});


    bool _isPressed = false;
  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MiniPlayerModel>(
      builder: (context, miniPlayerModel, _) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInCirc,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget._isPressed ? 20 : 10),
          color: widget._isPressed ? Colors.grey : Color.fromARGB(225, 231, 4, 4),
        ),

        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongScreen(),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(159, 11, 65, 90),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: const Image(
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        image: AssetImage("assets/Image/Yuvan.jpg"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oru Nalil",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Avenir_med",
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Yuavn Shankar Raja",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontFamily: "Avenir_reg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        miniPlayerModel.toggleAdd();
                      },
                      icon: miniPlayerModel.currentState == MiniPlayerState.adding
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 30,
                            )
                          : const Icon(
                              Icons.add_circle_outline_outlined,
                              color: txtclr,
                              size: 30,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        miniPlayerModel.togglePlayPause();
                      },
                      icon: miniPlayerModel.currentState == MiniPlayerState.playing
                          ? const Icon(
                              Icons.pause,
                              color: txtclr,
                              size: 30,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              color: txtclr,
                              size: 30,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0, // Adjust the height of the slider
                width: 390, // Adjust the width of the slider
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                    trackHeight: 2, // Adjust the track height of the slider
                  ),
                  child: Slider(
                    min: 0,
                    max: 100,
                    value: 50,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {
                      // Handle slider value change
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
