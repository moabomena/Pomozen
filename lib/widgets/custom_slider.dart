import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;
  BuildContext context;

  final themeController = Get.find<TimerController>();
  CustomSliderThumbCircle({
    required this.context,
    required this.thumbRadius,
    this.min = 1,
    this.max = 60,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final backgroundPaint = Paint()
      ..color = Theme.of(this.context).backgroundColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, backgroundPaint);
    canvas.drawCircle(center, thumbRadius * .9, borderPaint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}

// ignore: must_be_immutable
class SliderSettingsTimers extends StatelessWidget {
  SliderSettingsTimers(
      {required this.activeTrackColor,
      required this.inactiveTrackColor,
      required this.thumbColor,
      required this.overlayColor,
      required this.thumbRadius,
      required this.slider,
      Key? key})
      : super(key: key);

  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color overlayColor;
  double thumbRadius;
  Slider slider;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: activeTrackColor,
          inactiveTrackColor: inactiveTrackColor,
          trackShape: const RectangularSliderTrackShape(),
          trackHeight: 4.0,
          thumbColor: thumbColor,
          thumbShape: CustomSliderThumbCircle(
              context: context, thumbRadius: thumbRadius),
          overlayColor: overlayColor),
      child: slider,
    );
  }
}
