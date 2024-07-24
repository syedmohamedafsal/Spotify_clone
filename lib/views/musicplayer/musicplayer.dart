import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/const/const_clr.dart';
import 'package:spotify_clone/controller/songscreen.dart';

class SongScreen extends StatefulWidget {
  final String trackName;
  final String artists;
  final String albumImageUrl;
  final String trackId;
  final List<String> trackList;

  const SongScreen({
    Key? key,
    required this.trackName,
    required this.artists,
    required this.albumImageUrl,
    required this.trackId,
    required this.trackList,
  }) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SongScreenProvider>(context, listen: false);
      Provider.of<SongScreenProvider>(context, listen: false).setTrackList([
        '5jvhTc0g18kwYQNUJM5C4e',
        '72t3CRd8YEFrlc3x0OVaob',
        '5TkQatzJqKafPgHQerZ0dL',
        '6IW5ocUH5DRWagxkLTlbUS',
        '1ijjjMFlM3Pe8t3ykXBzxk',
        '4a1WLOoydq7u011UG9jjC9',
        '4hy4nY2PiYWx8qVXjpky3P',
        '4PpYi6USHlY7OhOcDASnD3',
        '5gx3dMxQGJ1JDw5qHarRqp',
        '4PUniKS3Cywu23xjdtoji5',
      ]);

      provider.playSong(widget.trackId);
    });
  }

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
                color: txtclr,
                fontFamily: "Avenir_reg",
                fontSize: 15,
              ),
            ),
            Text(
              "Liked Songs",
              style: TextStyle(
                color: txtclr,
                fontFamily: "Avenir_bold",
                fontSize: 15,
              ),
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
            ),
          )
        ],
      ),
      body: Consumer<SongScreenProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: widget.albumImageUrl.isNotEmpty
                      ? Image.network(
                          widget.albumImageUrl,
                          height: 380,
                          width: 380,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/Image/Yuvan.jpg',
                              height: 380,
                              width: 380,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/Image/Yuvan.jpg',
                          height: 380,
                          width: 380,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 62),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.currentTrack?.name ?? '',
                            style: const TextStyle(
                              color: txtclr,
                              fontFamily: "Avenir_bold",
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            provider.currentTrack?.artists
                                    ?.map((artist) => artist.name ?? 'Unknown')
                                    .join(', ') ??
                                'Unknown Artist',
                            style: const TextStyle(
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
                        provider.addToPlaylist();
                      },
                      icon: Icon(
                        provider.isAdded
                            ? Icons.done
                            : Icons.add_circle_outline,
                        color: provider.isAdded ? Colors.green : Colors.white,
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
                      max: provider.totalDuration.inSeconds.toDouble(),
                      value: provider.currentPosition.inSeconds.toDouble(),
                      onChanged: (value) {
                        provider.seekTo(Duration(seconds: value.toInt()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Row(
                      children: [
                        Text(
                          _formatDuration(provider.currentPosition),
                          style: const TextStyle(
                            color: txtclr,
                            fontFamily: "Avenir_med",
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _formatDuration(provider.totalDuration),
                          style: const TextStyle(
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
                            provider.shuffleSongs();
                          },
                          icon: Icon(
                            provider.isShuffle
                                ? Icons.shuffle
                                : Icons.shuffle_sharp,
                            color: provider.isShuffle
                                ? Colors.green
                                : Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.skipPrevious();
                          },
                          icon: const Icon(
                            Icons.skip_previous_rounded,
                            color: txtclr,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (provider.isPlaying) {
                              provider.pauseSong();
                            } else {
                              provider.resumeSong();
                            }
                          },
                          icon: Icon(
                            provider.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_fill,
                            color: Colors.green,
                            size: 50,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.skipNext();
                          },
                          icon: const Icon(
                            Icons.skip_next_rounded,
                            color: txtclr,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.repeatSong();
                          },
                          icon: Icon(
                            provider.isRepeat ? Icons.repeat_one : Icons.repeat,
                            color:
                                provider.isRepeat ? Colors.green : Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
