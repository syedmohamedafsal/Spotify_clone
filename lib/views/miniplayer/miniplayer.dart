import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/miniplayerstate.dart';
import 'package:spotify_clone/views/musicplayer/musicplayer.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  void initState() {
    super.initState();

    // Fetch track information when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final miniPlayerModel =
          Provider.of<MiniPlayerModel>(context, listen: false);
      fetchTrackInfo(miniPlayerModel);
    });
  }

  void fetchTrackInfo(MiniPlayerModel miniPlayerModel) {
    // Replace with your actual track information fetching logic
    String trackName = '';
    List<String> artists = ['Artist 1', 'Artist 2'];
    String albumImageUrl =
        'https://i.scdn.co/image/ab67616d0000b27367c738a703dc979f5c3c52ef';

    print('Fetching track info: $trackName, $artists, $albumImageUrl');
    miniPlayerModel.loadTrackInfo(trackName, artists, albumImageUrl, trackName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MiniPlayerModel>(
      builder: (context, miniPlayerModel, _) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInCirc,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(miniPlayerModel.isAdded ? 10 : 10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongScreen(
                  trackList: [],
                  trackId: miniPlayerModel.trackId,
                  trackName: miniPlayerModel.trackName,
                  artists: miniPlayerModel.artists.join(', '),
                  albumImageUrl: miniPlayerModel.albumImageUrl,
                ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          miniPlayerModel.albumImageUrl,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 50,
                            );
                          },
                        )),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Makina',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Avenir_med",
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Uzi , Mavi',
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
                      icon: miniPlayerModel.isAdded
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 30,
                            )
                          : const Icon(
                              Icons.add_circle_outline_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        miniPlayerModel.togglePlayPause();
                      },
                      icon: miniPlayerModel.currentState ==
                              MiniPlayerState.playing
                          ? const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 30,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10, // Adjust the height of the slider
                width: 390, // Adjust the width of the slider
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 5),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 10),
                    trackHeight: 3, // Adjust the track height of the slider
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withOpacity(0.4),
                  ),
                  child: Slider(
                    min: 0,
                    max: miniPlayerModel.totalDuration.inSeconds.toDouble(),
                    value: miniPlayerModel.currentPosition.inSeconds.toDouble(),
                    onChanged: (double value) {
                      miniPlayerModel
                          .updatePosition(Duration(seconds: value.toInt()));
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
