import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? textButton;
  final Color? textColor;
  final Color? backgroundColorButton;

  final double? elevationButton;
  const CustomButton(
      {Key? key,
      this.onTap,
      this.textButton,
      this.backgroundColorButton,
      this.textColor,
      this.elevationButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevationButton),
            backgroundColor: MaterialStateProperty.all(backgroundColorButton)),
        onPressed: onTap,
        child: Text(
          textButton!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.02,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
