import 'package:flutter/material.dart';
import 'package:spotify_clone/const/const_clr.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  bool _istapped = true;
  bool _shuffuletap = true;
  bool _playpause = true;
  bool _repeattap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarclr,
      appBar: AppBar(
        backgroundColor: appBarclr,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: txtclr,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "Playing From Your Library",
              style: TextStyle(
                  color: txtclr, fontFamily: "Avenir_reg", fontSize: 15),
            ),
            Text(
              "Liked Songs",
              style: TextStyle(
                  color: txtclr, fontFamily: "Avenir_bold", fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: txtclr,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          kheight,
          kheight,
          const Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                  height: 380,
                  width: 380,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Image/Yuvan.jpg")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kheight,
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oru Naalil",
                        style: TextStyle(
                          color: txtclr,
                          fontFamily: "Avenir_bold",
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Yuvan Shankar Raja , Na.Muthukumar",
                        style: TextStyle(
                          color: txtclr,
                          fontFamily: "Avenir_med",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _istapped = !_istapped;
                    });
                  },
                  icon: Icon(
                    !_istapped ? Icons.done : Icons.add_circle_outline,
                    color: !_istapped ? Colors.green : Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.white,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 5),
                    trackHeight: 1, // Adjust the track height of the slider
                  ),
                  child: Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: 100,
                      value: 50,
                      onChanged: (double) {})),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 20),
                child: Row(
                  children: [
                    Text(
                      "0:00",
                      style: TextStyle(
                        color: txtclr,
                        fontFamily: "Avenir_med",
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "6:22",
                      style: TextStyle(
                        color: txtclr,
                        fontFamily: "Avenir_med",
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _shuffuletap = !_shuffuletap;
                        });
                      },
                      icon: Icon(
                        !_shuffuletap ? Icons.shuffle : Icons.shuffle_sharp,
                        color: !_shuffuletap ? Colors.green : Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous_rounded,
                        color: txtclr,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _playpause = !_playpause;
                        });
                      },
                      icon: Icon(
                        !_playpause
                            ? Icons.play_circle_fill
                            : Icons.pause_circle_filled,
                        color: !_playpause ? Colors.green : Colors.green,
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next_rounded,
                        color: txtclr,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _repeattap = !_repeattap;
                        });
                      },
                      icon: Icon(
                        !_repeattap ? Icons.repeat_one : Icons.repeat,
                        color: !_repeattap ? Colors.green : Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
