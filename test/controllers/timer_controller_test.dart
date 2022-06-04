import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';

void main() {
  test('showButtonReset has to be false', () {
    expect(showButtonReset.value, false);
  });

  test('The default value for the working time is 25 minutes', () {
    expect(currentSliderValueWork, 25);
  });
  test('The default value for pause should be 5 minutes', () {
    expect(currentSliderValueShortBreak, 5);
  });

  test('The default value for long pause should be 15 minutes', () {
    expect(currentSliderValueLongBreak, 15);
  });
  test('the remaining time has to be always return 25*60', () {
    expect(remainingTimer, 1500);
  });
  test('TotalTime must be 25', () {
    expect(totalTimer.value, 25);
  });
  test('shortBreakTimer must be 5', () {
    expect(shortBreakTimer.value, 5);
  });
  test('longBreakTimer must be 15', () {
    expect(longBreakTimer.value, 15);
  });

  test('the value always has to be an integer for TotalTimer', () {
    setTotalTimer(23);

    expect(totalTimer.value, 23);
  });
  test('the value always has to be an integer for shortBreak', () {
    setShortBreak(5);
    expect(shortBreakTimer.value, 5);
  });

  test('the value always has to be an integer for longBreak ', () {
    setLongBreak(15);
    expect(longBreakTimer.value, 15);
  });
  test('increment a value to the serial number of pomodoros', () {
    setNum.value = 2;
    incrementSetNum();
    expect(setNum.value, 3);
  });
  test('reset setNum series number', () {
    setNum.value = 10;
    resetSetNum();
    expect(setNum.value, 0);
  });
  test('increase the number of pomodoros', () {
    pomodoroNum.value = 4;
    incrementPomodoroNum();
    expect(pomodoroNum.value, 5);
  });

  test('reset the number of pomodoros', () {
    pomodoroNum.value = 10;
    resetPomodoroNum();
    expect(pomodoroNum.value, 0);
  });

  test('the value of the text of the butao must be a String', () {
    setMainBtnText('Start pomodoro');
    expect(mainBtnText.value, 'Start pomodoro');
  });
}
