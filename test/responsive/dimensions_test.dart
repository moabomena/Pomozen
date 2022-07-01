import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/responsive/dimensions.dart';

void main() {
  test('witdh of pomodoro Num and set num should be 0.1', () {
    expect(widthPomodoroNumAndSetNum, 0.1);
  });

  test('height of pomodoro num and set num should be 0.05', () {
    expect(heightPomodoroNumAndSetNum, 0.05);
  });

  test('border Radius indicator should be 0.008', () {
    expect(borderRadiusIndicator, 0.008);
  });

  test('font size indicator should be 0.022', () {
    expect(fontSizeIndicator, 0.022);
  });

  test('text Scale factor status description should be 0.0025', () {
    expect(textScaleFactorStatusDescription, 0.0025);
  });

  test('height sizedBox 1 should be 0.04', () {
    expect(heightSizedBox1, 0.04);
  });

  test('height sizedBox 2 should be 0.12', () {
    expect(heightSizedBox2, 0.12);
  });

  test('animatedPositionedTrue should be 0.12', () {
    expect(animatedPositionedTrue, 0.12);
  });

  test('animatedPositionedFalse should be 0.325', () {
    expect(animatedPositionedFalse, 0.325);
  });
}
