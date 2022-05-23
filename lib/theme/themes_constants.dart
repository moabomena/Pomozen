import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  indicatorColor: Colors.grey[300],
  primaryColor: Colors.grey[200],
  backgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black54,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'OpenSans'),
    headline6: TextStyle(
        fontSize: 30.0, fontStyle: FontStyle.italic, fontFamily: 'OpenSans'),
    bodyText1: TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      fontFamily: 'OpenSans',
    ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      fontFamily: 'OpenSans',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(150, 100)),
          maximumSize: MaterialStateProperty.all<Size>(const Size(150, 100)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.deepOrange))),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ))),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange[400],
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.grey[800],
  backgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  indicatorColor: Colors.grey[800],
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'OpenSans'),
    headline6: TextStyle(
        fontSize: 30.0, fontStyle: FontStyle.italic, fontFamily: 'OpenSans'),
    bodyText1: TextStyle(
      color: Colors.white54,
      fontSize: 14.0,
      fontFamily: 'OpenSans',
    ),
    bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'OpenSans'),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(150, 100)),
          maximumSize: MaterialStateProperty.all<Size>(const Size(150, 100)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.deepOrange[700] as Color))),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ))),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange[700],
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);
