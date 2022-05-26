import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';

void main() {
  ThemeController themeController = ThemeController();
  test('the value always returns false by default', () {
    expect(themeController.isSwitchedDark, false.obs);
  });

  test('the value must return a boolean', () {
    themeController.setSwitchedDark(true);
    expect(themeController.isSwitchedDark, true.obs);
  });
}
