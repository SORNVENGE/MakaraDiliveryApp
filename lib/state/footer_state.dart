import 'package:flutter/material.dart';

class FooterState extends ChangeNotifier {
  int _menuIndex = 0;
  int get menuIndex => _menuIndex;
  void changeMenuIndex(int value) {
    _menuIndex = value;
    notifyListeners();
  }
}
