import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/ux_controller.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {this.indexSelect, this.ontap, this.icon, this.title, Key? key})
      : super(key: key);

  final String? title;
  final IconData? icon;
  final GestureTapCallback? ontap;
  final int? indexSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: indexPage.value == indexSelect ? Colors.orange[50] : null),
      child: ListTile(
        leading: Icon(
          icon,
          size: MediaQuery.of(context).size.width * 0.07,
          color: indexPage.value == indexSelect ? Colors.orange : null,
        ),
        minLeadingWidth: 1,
        title: Text(
          title!,
          style: TextStyle(
              color: indexPage.value == indexSelect ? Colors.orange : null,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
        onTap: ontap,
      ),
    );
  }
}
