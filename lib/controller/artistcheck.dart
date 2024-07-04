import 'package:flutter/material.dart';

class ArtistProvider extends ChangeNotifier {
  List<String> selectedData = [];

  void addToSelectedData(String artistName) {
    selectedData.add(artistName);
    notifyListeners();
  }

  void removeFromSelectedData(String artistName) {
    selectedData.remove(artistName);
    notifyListeners();
  }
}
