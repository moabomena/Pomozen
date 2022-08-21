import 'package:flutter/material.dart';
import 'package:Pomozen/responsive/dimensions.dart';

class ProgressIcons extends StatelessWidget {
  final int? total;
  final int? done;
  const ProgressIcons({@required this.total, @required this.done, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doneIcon = Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: MediaQuery.of(context).size.width * progressIconsSize,
      height: MediaQuery.of(context).size.height * progressIconsSize,
      decoration: BoxDecoration(
        color: Colors.greenAccent[400],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent[400]!,
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          )
        ],
      ),
    );

    final notDoneIcon = Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: MediaQuery.of(context).size.width * progressIconsSize,
      height: MediaQuery.of(context).size.height * progressIconsSize,
      decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor, shape: BoxShape.circle),
    );

    List<Container> indicator = [];

    for (int i = 0; i < total!; i++) {
      if (i < done!) {
        indicator.add(doneIcon);
      } else {
        indicator.add(notDoneIcon);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: indicator),
    );
  }
}
