import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/model/settings_slide.dart';

void main() {
  test('the quantity must always be 3 of ResetSlider', () {
    expect(ResetSlider.values.length, 3);
  });
  test('return the exact value of String of the ResetSlider', () {
    expect(ResetSlider.values.byName('resetWork'), ResetSlider.resetWork);

    expect(ResetSlider.values.byName('resetShortBreak'),
        ResetSlider.resetShortBreak);

    expect(ResetSlider.values.byName('resetLongBreak'),
        ResetSlider.resetLongBreak);
  });
}
