import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:Pomozen/model/pomodoro_status.dart';

final ValueNotifier<PomodoroStatus> pomodoroStatus =
    ValueNotifier(PomodoroStatus.pausedPomodoro);

final ValueNotifier<Timer> timer =
    ValueNotifier(Timer.periodic(const Duration(seconds: 1), (timer) {}));

final ValueNotifier<bool> showButtonReset = ValueNotifier(false);

final ValueNotifier<int> currentSliderValueWork = ValueNotifier(25);
final ValueNotifier<int> currentSliderValueShortBreak = ValueNotifier(5);
final ValueNotifier<int> currentSliderValueLongBreak = ValueNotifier(15);

final ValueNotifier<int> remainingTimer = ValueNotifier(25 * 60);

final ValueNotifier<int> totalTimer = ValueNotifier(25);
final ValueNotifier<int> shortBreakTimer = ValueNotifier(5);
final ValueNotifier<int> longBreakTimer = ValueNotifier(15);

final ValueNotifier<int> pomodoroNum = ValueNotifier(0);
final ValueNotifier<int> setNum = ValueNotifier(0);

ValueNotifier<String> mainBtnText = ValueNotifier('START POMODORO');

final ValueNotifier<int> removeDelayOfNotification = ValueNotifier(25 * 60);

void setTotalTimer(var newValue) => totalTimer.value = newValue;
void setShortBreak(var newValue) => shortBreakTimer.value = newValue;
void setLongBreak(var newValue) => longBreakTimer.value = newValue;

void setTimerWorkSlider(var newValue) =>
    currentSliderValueWork.value = newValue;
void setTimerShortBreakSlider(var newValue) =>
    currentSliderValueShortBreak.value = newValue;
void setTimerLongBreakSlider(var newValue) =>
    currentSliderValueLongBreak.value = newValue;

void setRemainingTime(var newValue) => remainingTimer.value = newValue * 60;

void setValueTimerNotification(var newValue) =>
    removeDelayOfNotification.value = (newValue * 60) - 1;

void incrementSetNum() => setNum.value++;
void resetSetNum() => setNum.value = 0;

void incrementPomodoroNum() => pomodoroNum.value++;
void resetPomodoroNum() => pomodoroNum.value = 0;

void setMainBtnText(var newValue) => mainBtnText.value = newValue;

void setPomodoroStatus(var newValue) => pomodoroStatus.value = newValue;

void setShowButtonReset(var newValue) => showButtonReset.value = newValue;
