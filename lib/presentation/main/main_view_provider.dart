import 'package:flutter/material.dart';

class MainViewProvider with ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(currentIndex){
    this.currentIndex = currentIndex;
    notifyListeners();
  }

}
