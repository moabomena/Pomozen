import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';

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

void setTotalTimer(var value) => totalTimer.value = value;
void setShortBreak(var value) => shortBreakTimer.value = value;
void setLongBreak(var value) => longBreakTimer.value = value;

void setTimerWorkSlider(var value) => currentSliderValueWork.value = value;
void setTimerShortBreakSlider(var value) =>
    currentSliderValueShortBreak.value = value;
void setTimerLongBreakSlider(var value) =>
    currentSliderValueLongBreak.value = value;

void setRemainingTime(var value) => remainingTimer.value = value * 60;

void setValueTimerNotification(var value) =>
    removeDelayOfNotification.value = (value * 60) - 1;

void incrementSetNum() => setNum.value++;
void resetSetNum() => setNum.value = 0;

void incrementPomodoroNum() => pomodoroNum.value++;
void resetPomodoroNum() => pomodoroNum.value = 0;

void setMainBtnText(var value) => mainBtnText.value = value;

void setPomodoroStatus(var value) => pomodoroStatus.value = value;

void setShowButtonReset(var value) => showButtonReset.value = value;
