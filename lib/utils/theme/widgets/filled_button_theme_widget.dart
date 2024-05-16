import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants.dart';

class FilledThemeWidget {
  FilledThemeWidget._();
  static final List<FilledButtonThemeData> _filledBtns = [
    FilledButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(AppStyleDefaultProperties.bp)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyleDefaultProperties.r),
          ),
        ),
      ),
    ),
    FilledButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.all(AppStyleDefaultProperties.bp)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyleDefaultProperties.r),
          ),
        ),
      ),
    )
  ];
  //getter
  static FilledButtonThemeData get light => _filledBtns.first;
  static FilledButtonThemeData get dark => _filledBtns.last;
}
