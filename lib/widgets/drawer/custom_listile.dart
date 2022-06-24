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
    return ListTile(
      tileColor: indexPage.value == indexSelect
          ? Theme.of(context).listTileTheme.tileColor
          : Colors.transparent,
      leading: Icon(icon,
          size: MediaQuery.of(context).size.width * 0.06,
          color: indexPage.value == indexSelect
              ? Colors.orange
              : Theme.of(context).textTheme.bodyText1!.color),
      minLeadingWidth: 1,
      title: Text(
        title!,
        style: TextStyle(
            color: indexPage.value == indexSelect
                ? Colors.orange
                : Theme.of(context).textTheme.bodyText1!.color,
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSans'),
      ),
      onTap: ontap,
    );
  }
}