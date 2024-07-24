import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

enum MiniPlayerState { stopped, playing, paused, adding }

class MiniPlayerModel extends ChangeNotifier {
  MiniPlayerState _currentState = MiniPlayerState.stopped;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isAdded = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  MiniPlayerModel() {
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      _currentPosition = position;
      notifyListeners();
      
    });
  }

  MiniPlayerState get currentState => _currentState;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  bool get isAdded => _isAdded;

  void togglePlayPause() {
    if (_currentState == MiniPlayerState.playing) {
      _audioPlayer.pause();
      _currentState = MiniPlayerState.paused;
    } else {
      _audioPlayer.play(UrlSource('https://p.scdn.co/mp3-preview/1d53b96abb564f9ba08427c3c5361dd8fbe72f7d?cid=d8a5ed958d274c2e8ee717e6a4b0971d'));
      _currentState = MiniPlayerState.playing;
    }
    notifyListeners();
  }

  void toggleAdd() {
    _isAdded = !_isAdded;
    _currentState = _isAdded ? MiniPlayerState.adding : MiniPlayerState.stopped;
    notifyListeners();
  }

  void updatePosition(Duration newPosition) {
    _audioPlayer.seek(newPosition);
    _currentPosition = newPosition;
    notifyListeners();
  }
}
