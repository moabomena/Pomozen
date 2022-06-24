import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/controllers/intl_controller.dart';

void main() {
  test('test choose intl', () {
    expect('en', intl.value);
  });
  test('test choose intl for pt output', () {
    setIntl('pt');

    expect('pt', intl.value);
  });
}
