import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/utils/constants.dart';
import 'package:pomodoro_app/utils/notifications.dart';
import 'package:pomodoro_app/widgets/custom_button.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pomodoro_app/screens/settings_page.dart';

import '../widgets/progress_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

const _btnTextStart = 'START POMODORO';
const _btnTextResumePomodoro = 'RESUME POMODORO';
const _btnTextResumeBreak = 'RESUME BREAK';
const _btnTextStartShortBreak = 'TAKE SHORT BREAK';
const _btnTextStartLongBreak = 'TAKE LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextPause = 'PAUSE';
const _btnTextReset = 'RESET';

class _HomeState extends State<Home> {
  static final timerCtl = Get.put(TimerController());

  static AudioCache player = AudioCache();

  @override
  void initState() {
    player.load('bell.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Color.fromARGB(255, 11, 184, 83),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: const Text('Pomodoro'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0),
        backgroundColor: const Color.fromARGB(255, 154, 216, 156),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text(
                    'Pomodoro number: ' + timerCtl.pomodoroNum.value.toString(),
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                Obx(
                  () => Text(
                    'set: ' + timerCtl.setNum.value.toString(),
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 125.0,
                          lineWidth: 15.0,
                          percent: _getPomodoroPercentage(),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Obx(
                            () => Text(
                              _secondsToFormatedString(
                                  timerCtl.remainingTimer.value),
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white),
                            ),
                          ),
                          progressColor: statusColor[timerCtl.pomodoroStatus],
                          backgroundColor: Colors.red[100] as Color,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProgressIcons(
                            total: pomodoriPerset,
                            done: timerCtl.pomodoroNum.value -
                                (timerCtl.setNum.value * pomodoriPerset)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          statusDescription[timerCtl.pomodoroStatus],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            onTap: _mainButtonPressed,
                            text: timerCtl.mainBtnText.value),
                        CustomButton(
                            onTap: _resetButtonPressed, text: _btnTextReset),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _secondsToFormatedString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormated;

    if (remainingSeconds < 10) {
      remainingSecondsFormated = '0$remainingSeconds';
    } else {
      remainingSecondsFormated = remainingSeconds.toString();
    }

    return '$roundedMinutes:$remainingSecondsFormated';
  }

  _mainButtonPressed() {
    switch (timerCtl.pomodoroStatus) {
      case PomodoroStatus.pausedPomodoro:
        _startPomodoroCountdown();
        break;
      case PomodoroStatus.runingPomodoro:
        _pausePomodoroCountdown();
        break;
      case PomodoroStatus.runningShortBreak:
        _pauseShortBreakCountdown();
        break;
      case PomodoroStatus.pausedShortBreak:
        _startShortBreak();
        break;
      case PomodoroStatus.runningLongBreak:
        _pauseLongBreakCountdown();
        break;
      case PomodoroStatus.pausedLongBreak:
        _startLongBreak();
        break;
      case PomodoroStatus.setFinished:
        timerCtl.incrementSetNum();
        _startPomodoroCountdown();
        break;
    }
  }

  _getPomodoroPercentage() {
    int totalTime;
    switch (timerCtl.pomodoroStatus) {
      case PomodoroStatus.runingPomodoro:
        totalTime = timerCtl.totalTimer.value * 60;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = timerCtl.totalTimer.value * 60;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = timerCtl.shortBreakTimer.value * 60;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = timerCtl.shortBreakTimer.value * 60;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = timerCtl.longBreakTimer.value * 60;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = timerCtl.longBreakTimer.value * 60;
        break;
      case PomodoroStatus.setFinished:
        totalTime = timerCtl.totalTimer.value * 60;
        break;
    }
    double percentage = (totalTime - timerCtl.remainingTimer.value) / totalTime;
    print(percentage);
    return percentage;
  }

  _startPomodoroWithoutDelay() {
    Timer.run(() {
      if (timerCtl.remainingTimer.value > 0) {
        timerCtl.removeDelayOfNotification.value--;
        timerCtl.remainingTimer.value--;
        timerCtl.setMainBtnText(_btnTextPause);
      }
    });
  }

  _startPomodoroCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.runingPomodoro);
    _startPomodoroWithoutDelay();
    _cancelTime();
    timerCtl.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCtl.remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: foque na tarefa',
            body: _secondsToFormatedString(
                timerCtl.removeDelayOfNotification.value));
        timerCtl.removeDelayOfNotification.value--;
        timerCtl.remainingTimer.value--;
        timerCtl.setMainBtnText(_btnTextPause);
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Iniciar pausa de 5 minutos');
        _playSound();
        timerCtl.incrementPomodoroNum();
        _cancelTime();
        if (timerCtl.pomodoroNum.value % pomodoriPerset == 0) {
          timerCtl.setPomodoroStatus(PomodoroStatus.pausedLongBreak);
          timerCtl.setValueTimerNotification(
              timerCtl.currentSliderValueLongBreak.value);

          timerCtl.setRemainingTime(timerCtl.longBreakTimer.value);
          timerCtl.setMainBtnText(_btnTextStartLongBreak);
        } else {
          timerCtl.setPomodoroStatus(PomodoroStatus.pausedShortBreak);
          timerCtl.setValueTimerNotification(
              timerCtl.currentSliderValueShortBreak.value);
          timerCtl.setRemainingTime(timerCtl.shortBreakTimer.value);
          timerCtl.setMainBtnText(_btnTextStartShortBreak);
        }
      }
    });
  }

  _startShortBreak() {
    timerCtl.setPomodoroStatus(PomodoroStatus.runningShortBreak);
    timerCtl.setMainBtnText(_btnTextPause);
    _startPomodoroWithoutDelay();
    _cancelTime();
    timerCtl.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCtl.remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: Descanse por 5 minutos',
            body: _secondsToFormatedString(
                timerCtl.removeDelayOfNotification.value));
        timerCtl.removeDelayOfNotification.value--;
        timerCtl.remainingTimer.value--;
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Retorne ao trabalho!');
        _playSound();
        timerCtl
            .setValueTimerNotification(timerCtl.currentSliderValueWork.value);
        timerCtl.setRemainingTime(timerCtl.totalTimer.value);
        _cancelTime();
        timerCtl.setPomodoroStatus(PomodoroStatus.pausedPomodoro);
        timerCtl.setMainBtnText(_btnTextStart);
      }
    });
  }

  _startLongBreak() {
    timerCtl.setPomodoroStatus(PomodoroStatus.runningLongBreak);
    timerCtl.setMainBtnText(_btnTextPause);
    _startPomodoroWithoutDelay();
    _cancelTime();
    timerCtl.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCtl.remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: Descanse por 15 minutos',
            body: _secondsToFormatedString(
                timerCtl.removeDelayOfNotification.value));
        timerCtl.removeDelayOfNotification.value--;
        timerCtl.remainingTimer.value--;
      } else {
        localNotifications(
            title: 'Pomodoro: CICLO FINALIZADO!',
            body: 'Inicie um novo ciclo!');
        _playSound();
        timerCtl
            .setValueTimerNotification(timerCtl.currentSliderValueWork.value);
        timerCtl.setRemainingTime(timerCtl.totalTimer.value);
        _cancelTime();
        timerCtl.setPomodoroStatus(PomodoroStatus.setFinished);
        timerCtl.setMainBtnText(_btnTextStartNewSet);
      }
    });
  }

  _pausePomodoroCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.pausedPomodoro);
    _cancelTime();
    timerCtl.setMainBtnText(_btnTextResumePomodoro);
  }

  _resetButtonPressed() {
    timerCtl.resetPomodoroNum();
    timerCtl.resetSetNum();
    _cancelTime();
    _stopCountdown();
  }

  _stopCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.pausedPomodoro);

    timerCtl.setMainBtnText(_btnTextStart);
    timerCtl.setValueTimerNotification(timerCtl.currentSliderValueWork.value);
    timerCtl.setRemainingTime(timerCtl.totalTimer.value);
  }

  _pauseShortBreakCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.pausedShortBreak);
    _pauseBreakCountdown();
  }

  _pauseLongBreakCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.pausedLongBreak);
    _pauseBreakCountdown();
  }

  _pauseBreakCountdown() {
    _cancelTime();
    timerCtl.setMainBtnText(_btnTextResumeBreak);
  }

  _cancelTime() {
    if (timerCtl.timer != null) {
      timerCtl.timer.cancel();
    }
  }

  _playSound() {
    player.play('bell.mp3');
  }
}
