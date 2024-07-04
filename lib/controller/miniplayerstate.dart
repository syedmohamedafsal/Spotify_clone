import 'package:flutter/material.dart';

enum MiniPlayerState { paused, playing, adding }

class MiniPlayerModel extends ChangeNotifier {
  MiniPlayerState _currentState = MiniPlayerState.paused;

  MiniPlayerState get currentState => _currentState;

  void togglePlayPause() {
    if (_currentState == MiniPlayerState.paused) {
      _currentState = MiniPlayerState.playing;
    } else {
      _currentState = MiniPlayerState.paused;
    }
    notifyListeners();
  }

  void toggleAdd() {
    _currentState = MiniPlayerState.adding;
    notifyListeners();
    // Simulate an added state (optional)
    Future.delayed(Duration(seconds: 1), () {
      _currentState = MiniPlayerState.paused;
      notifyListeners();
    });
  }
}
