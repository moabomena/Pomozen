import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/controllers/ux_controller.dart';

void main() {
  test('test index page of drawer select', () {
    setIndexPage(3);
    expect(indexPage.value, 3);

    setIndexPage(6);
    expect(indexPage.value, 6);

    setIndexPage(0);
    expect(indexPage.value, 0);
  });
}
