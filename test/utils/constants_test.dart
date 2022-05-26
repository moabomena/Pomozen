import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/utils/constants.dart';

void main() {
  test('number of pomodoros must always return 4', () {
    expect(pomodoriPerset, 4);
  });
}
