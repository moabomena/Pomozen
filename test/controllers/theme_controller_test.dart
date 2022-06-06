import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';

void main() {
  test('the value always returns false by default', () {
    expect(modeDark.value, false);
  });

  test('the value must return a boolean', () {
    modeDark.value = true;
    expect(modeDark.value, true);
  });
}
