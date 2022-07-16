import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer/custom_drawer.dart';
import 'package:pomodoro_app/widgets/drawer/willpop_callback.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => willPopCallback(context, 3),
        child: Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
              title: const Text('About'), centerTitle: true, elevation: 0),
        ));
  }
}
