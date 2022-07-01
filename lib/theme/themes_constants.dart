import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
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
        color: Colors.black,
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
            // minimumSize: MaterialStateProperty.all<Size>(const Size(150, 100)),
            // maximumSize: MaterialStateProperty.all<Size>(const Size(150, 100)),
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
    listTileTheme: ListTileThemeData(tileColor: Colors.orange[50]));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    drawerTheme:
        const DrawerThemeData(backgroundColor: Color.fromARGB(255, 19, 18, 18)),
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
        color: Colors.white,
        // fontSize: 14,
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
    listTileTheme:
        const ListTileThemeData(tileColor: Color.fromARGB(255, 100, 35, 15)));

navigationBarColor() {
  if (modeDark.value == true) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
  } else {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
  }
}
