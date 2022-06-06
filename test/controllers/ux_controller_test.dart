import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/controllers/ux_controller.dart';

void main() {
  test('test boolean hasdrawer', () {
    setHasDrawer(true);
    expect(true, hasDrawer.value == true);
  });
}
