import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  // getter
  ThemeMode get themeMode => _themeMode;

  // setter
  set themeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  // methods
  void switchTheme(ThemeMode value) => themeMode = value;
}
