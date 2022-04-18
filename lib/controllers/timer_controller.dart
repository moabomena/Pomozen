import 'package:get/get.dart';

class TimerController extends GetxController {
  var currentSliderValueWork = 25.obs;
  var currentSliderValueShortBreak = 5.obs;
  var currentSliderValueLongBreak = 15.obs;

  var remainingTimer = (25 * 60).obs;
  var shortBreakTimer = (5 * 60).obs;
  var longBreakTimer = (15 * 60).obs;

  var removeDelayOfNotification = (25 * 60).obs;

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
}
