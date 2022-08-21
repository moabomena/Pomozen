import 'package:flutter/material.dart';
import 'package:Pomozen/controllers/ux_controller.dart';
import 'package:Pomozen/responsive/dimensions.dart';

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
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: ValueListenableBuilder(
          valueListenable: indexPage,
          builder: (BuildContext context, value, Widget? child) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              tileColor: indexPage.value == indexSelect
                  ? Theme.of(context).listTileTheme.tileColor
                  : Colors.transparent,
              leading: Icon(icon,
                  size: MediaQuery.of(context).size.width *
                      customListTileIconSize,
                  color: indexPage.value == indexSelect
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyText1!.color),
              minLeadingWidth: 1,
              title: Text(
                title!,
                style: TextStyle(
                    color: indexPage.value == indexSelect
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: MediaQuery.of(context).size.width *
                        customListTileFontSize,
                    fontWeight: indexPage.value == indexSelect
                        ? FontWeight.w700
                        : FontWeight.w500,
                    fontFamily: 'OpenSans'),
              ),
              onTap: ontap,
            );
          }),
    );
  }
}
