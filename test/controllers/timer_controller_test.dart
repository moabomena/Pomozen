import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';

void main() {
  TimerController timerController = TimerController();

  test('showButtonReset has to be false', () {
    expect(timerController.showButtonReset, false.obs);
  });

  test('The default value for the working time is 25 minutes', () {
    expect(timerController.currentSliderValueWork, 25.obs);
  });
  test('The default value for pause should be 5 minutes', () {
    expect(timerController.currentSliderValueShortBreak, 5.obs);
  });

  test('The default value for long pause should be 15 minutes', () {
    expect(timerController.currentSliderValueLongBreak, 15.obs);
  });
  test('the remaining time has to be always return 25*60', () {
    expect(timerController.remainingTimer, 1500.obs);
  });
  test('TotalTime must be 25', () {
    expect(timerController.totalTimer, 25.obs);
  });
  test('shortBreakTimer must be 5', () {
    expect(timerController.shortBreakTimer, 5.obs);
  });
  test('longBreakTimer must be 15', () {
    expect(timerController.longBreakTimer, 15.obs);
  });

  test('the value always has to be an integer for TotalTimer', () {
    timerController.setTotalTimer(23);

    expect(timerController.totalTimer, 23.obs);
  });
  test('the value always has to be an integer for shortBreak', () {
    timerController.setShortBreak(5);
    expect(timerController.shortBreakTimer, 5.obs);
  });

  test('the value always has to be an integer for longBreak ', () {
    timerController.setLongBreak(15);
    expect(timerController.longBreakTimer, 15.obs);
  });
  test('increment a value to the serial number of pomodoros', () {
    timerController.setNum.value = 2;
    timerController.incrementSetNum();
    expect(timerController.setNum, 3.obs);
  });
  test('reset setNum series number', () {
    timerController.setNum.value = 10;
    timerController.resetSetNum();
    expect(timerController.setNum, 0.obs);
  });
  test('increase the number of pomodoros', () {
    timerController.pomodoroNum.value = 4;
    timerController.incrementPomodoroNum();
    expect(timerController.pomodoroNum, 5.obs);
  });

  test('reset the number of pomodoros', () {
    timerController.pomodoroNum.value = 10;
    timerController.resetPomodoroNum();
    expect(timerController.pomodoroNum, 0.obs);
  });

  test('the value of the text of the butao must be a String', () {
    timerController.setMainBtnText('Start pomodoro');
    expect(timerController.mainBtnText, 'Start pomodoro'.obs);
  });
}
