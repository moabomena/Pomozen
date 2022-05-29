import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/screens/home_screen.dart';
import 'package:pomodoro_app/theme/themes_constants.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: modeDark,
      builder: (BuildContext context, bool themeDark, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeDark ? darkTheme : lightTheme,
          themeMode: ThemeMode.system,
          home: const Home(),
        );
      },
    );
  }
}
