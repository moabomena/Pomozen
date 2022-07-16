import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer/custom_drawer.dart';
import 'package:pomodoro_app/widgets/drawer/willpop_callback.dart';

class UseLicenseScreen extends StatelessWidget {
  const UseLicenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context, 5),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Use license'),
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}
