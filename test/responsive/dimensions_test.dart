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
  test('height of floatingButton should be 0.08', () {
    expect(floatingButtonHeight, 0.08);
  });
  test('width of floatingButton should be 0.3', () {
    expect(floatingButtonWidth, 0.3);
  });
  test('boder of FloatingButton should be 0.016', () {
    expect(borderFloatingButton, 0.016);
  });
  test('the text size of floatingButton should be 0.022', () {
    expect(textSizeFloatingButton, 0.022);
  });
  test('width of custom button should be 0.35', () {
    expect(customButtonWidht, 0.35);
  });
  test('height of custom button should be 0.1', () {
    expect(customButtonHeight, 0.1);
  });
  test('the text size of custom button should be 0.02', () {
    expect(customButtonTextSize, 0.02);
  });
  test('the size of progress icon should be 0.03', () {
    expect(progressIconsSize, 0.03);
  });
  test('width of custom drawer should be 0.7', () {
    expect(customDrawerWidth, 0.7);
  });
  test('height of sizedBox in customDrawer should be 0.04', () {
    expect(customDrawerSizedBoxHeight, 0.04);
  });
  test('height of divider in CustomDrawer should be 0.02', () {
    expect(customDrawerDividerHeight, 0.02);
  });
  test('the icon size of customListTile should be 0.06', () {
    expect(customListTileIconSize, 0.06);
  });
  test('the font size of customListTile should be 0.045', () {
    expect(customListTileFontSize, 0.045);
  });
  test('the sizedBox widht of contact tile should be 0.05', () {
    expect(contactTileSizedBoxWidth, 0.05);
  });

  test('the font size title of contact tile should be 0.02', () {
    expect(contactTileFontSizeTitle, 0.02);
  });
  test('the font size subtitle of contact tile should be 0.017', () {
    expect(contactTileFontSizeSubtitle, 0.017);
  });
}
