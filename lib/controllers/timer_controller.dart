import 'dart:async';

import 'package:get/get.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';

class TimerController extends GetxController {
  var currentSliderValueWork = 25.obs;
  var currentSliderValueShortBreak = 5.obs;
  var currentSliderValueLongBreak = 15.obs;

  var remainingTimer = (25 * 60).obs;
  var shortBreakTimer = (5 * 60).obs;
  var longBreakTimer = (15 * 60).obs;

  var removeDelayOfNotification = (25 * 60).obs;

  var pomodoroNum = 0.obs;
  var setNum = 0.obs;

  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  var mainBtnText = 'START POMODORO'.obs;

  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void setTimerWork(var value) {
    currentSliderValueWork.value = value;
  }

  void setTimerShortBreak(var value) {
    currentSliderValueShortBreak.value = value;
  }

  void setTimerLongBreak(var value) {
    currentSliderValueLongBreak.value = value;
  }

  void setRemainingTime(var value) {
    remainingTimer.value = value * 60;
  }

  void setValueTimerNotification(var value) {
    removeDelayOfNotification.value = (value * 60) - 1;
  }

  void incrementSetNum() {
    setNum.value++;
  }

  void resetSetNum() {
    setNum.value = 0;
  }

  void incrementPomodoroNum() {
    pomodoroNum.value++;
  }

  void resetPomodoroNum() {
    pomodoroNum.value = 0;
  }

  void setMainBtnText(var value) {
    mainBtnText.value = value;
  }

  void setPomodoroStatus(var value) {
    pomodoroStatus = value;
  }
}
