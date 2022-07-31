import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    disabledColor: Colors.grey[300],
    scaffoldBackgroundColor: Colors.blue[100],
    appBarTheme: const AppBarTheme(
      elevation: 5,
      color: Colors.teal,
      iconTheme: IconThemeData(color: Colors.black, size: 30),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      primary: Colors.teal,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF8E8E93),
      secondary: Colors.white,
      onBackground: Colors.teal,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.black, //Color(0xFF82B229),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
        subtitle2: TextStyle(
            color: Color(0xFF8E8E93),
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400)),
  );

  static final ThemeData darkTheme = ThemeData(
    disabledColor: Colors.grey[300],
    scaffoldBackgroundColor: const Color(0XFF131A22),
    appBarTheme: const AppBarTheme(
      elevation: 5,
      color: Color(0XFF17212B),
      iconTheme: IconThemeData(color: Colors.black, size: 30),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.blue,
      primaryContainer: Color(0xFF6F8EAE),
      secondary: Color(0XFF2B5278),
      onBackground: Colors.blue,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.white, //Color(0xFF82B229),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
            color: Colors.black, //Color(0xFF82B229),
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
        subtitle2: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
        subtitle1: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400)),
  );
}
