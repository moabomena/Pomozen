import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/home_screen.dart';
import 'package:pomodoro_app/utils/notifications.dart';

Future<void> main() async {
  localNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Home(),
    );
  }
}
