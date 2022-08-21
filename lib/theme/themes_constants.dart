import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Pomozen/controllers/theme_controller.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(primary: Color(0xfff0f0f0)),
    brightness: Brightness.light,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.deepOrange),
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
          fontSize: 30.0, fontStyle: FontStyle.normal, fontFamily: 'OpenSans'),
      bodyText1: TextStyle(
        color: Colors.white60,
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
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrange[400]!))),
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
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: Colors.deepOrange[400]!),
      focusColor: Colors.deepOrange[400],
      iconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return Colors.deepOrange[400]!;
        }
        return Colors.grey;
      }),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange[400]!)),
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.deepOrange[400]));

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(primary: Color(0xff444444)),
    brightness: Brightness.dark,
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff9E2500)),
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
          fontSize: 30.0, fontStyle: FontStyle.normal, fontFamily: 'OpenSans'),
      bodyText1: TextStyle(
        color: Colors.white60,
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
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: Colors.deepOrange[400]!),
      focusColor: Colors.deepOrange[400],
      iconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return Colors.deepOrange[400]!;
        }
        return Colors.grey;
      }),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange[400]!)),
    ),
    listTileTheme: const ListTileThemeData(tileColor: Color(0xff891A01)));

navigationBarColor() {
  if (modeDark.value == true) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
  } else {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
  }
}
