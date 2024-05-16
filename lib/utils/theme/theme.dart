import 'package:flutter/material.dart';
import 'package:flutter_template/utils/theme/widgets/filled_button_theme_widget.dart';

import '../constants.dart';
import 'widgets/app_bar_theme_widget.dart';
import 'widgets/bottom_nav_bar_theme_widget.dart';
import 'widgets/elevated_button_theme_widget.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // brightness: Brightness.light,
    // colorSchemeSeed: AppThemeColors.primary,
    // fontFamily: AppThemeFonts.en,
    // fontFamilyFallback: AppThemeFonts.fonts,
    // appBarTheme: AppBarThemeWidget.light,
    // elevatedButtonTheme: ElevatedThemeWidget.light,
    // filledButtonTheme: FilledThemeWidget.light,
    //
    // cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavBarThemeWidget.light,
    scaffoldBackgroundColor: Color.fromRGBO(241,245,249, 1),
    cardTheme: CardTheme(color: Colors.white, elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Ajusta el radio de la curva del borde
        side: BorderSide(
          color: Color.fromRGBO(228, 231, 235, 1), // Color del borde
          width: 1.0, // Grosor del borde
        ),
      ),),

    // listTileTheme: const ListTileThemeData(selectedTileColor: AppThemeColors.primary),
    // inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder(
    //       borderSide: BorderSide(color: Colors.red, width: 1.0),
    // ),
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    // colorSchemeSeed: AppThemeColors.primary,
    // fontFamily: AppThemeFonts.en,
    // fontFamilyFallback: AppThemeFonts.fonts,
    //
    // elevatedButtonTheme: ElevatedThemeWidget.dark,
    // filledButtonTheme: FilledThemeWidget.dark,
    // bottomNavigationBarTheme: BottomNavBarThemeWidget.dark,
    // listTileTheme: const ListTileThemeData(selectedTileColor: Colors.white10),
    // cardColor: Colors.white,
    // cardTheme: CardTheme(color: Colors.white),
    // inputDecorationTheme: const InputDecorationTheme(
    //   border: OutlineInputBorder(),
    // ),
    appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(241,245,249, 1)),
    drawerTheme: DrawerThemeData(backgroundColor: Color.fromRGBO(34, 19, 43, 1)),
    bottomNavigationBarTheme: BottomNavBarThemeWidget.light,
    scaffoldBackgroundColor: Color.fromRGBO(241,245,249, 1),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Color.fromRGBO(228, 231, 235, 1),
          width: 1.0,
        ),
      ),),
  );
}
