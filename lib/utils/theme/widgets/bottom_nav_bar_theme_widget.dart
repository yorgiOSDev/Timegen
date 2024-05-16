import 'package:flutter/material.dart';

import '../../constants.dart';

class BottomNavBarThemeWidget {
  BottomNavBarThemeWidget._();
  static final List<BottomNavigationBarThemeData> _bottomNavBars = [
    const BottomNavigationBarThemeData(
      backgroundColor: AppThemeColors.inurePurple,
      selectedItemColor: AppThemeColors.inureOrange,
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.white),
    ),
    const BottomNavigationBarThemeData(
      backgroundColor: AppThemeColors.inurePurple,
      selectedItemColor: AppThemeColors.inureOrange,
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.white),
    ),
  ];
  //getter
  static BottomNavigationBarThemeData get light => _bottomNavBars.first;
  static BottomNavigationBarThemeData get dark => _bottomNavBars.last;
}
