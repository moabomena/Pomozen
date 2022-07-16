import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/ux_controller.dart';
import 'package:pomodoro_app/screens/home_screen.dart';

Future<bool> willPopCallback(BuildContext context, int index) async {
  if (indexPage.value == index) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false);
    setIndexPage(0);
  }

  return true;
}
