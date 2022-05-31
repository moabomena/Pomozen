import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/utils/constants.dart';
import 'package:pomodoro_app/utils/notifications.dart';
import 'package:pomodoro_app/widgets/custom_button.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:pomodoro_app/screens/settings_page.dart';

import '../controllers/theme_controller.dart';
import '../widgets/progress_icons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static final timerCtl = Get.put(TimerController());
  static final songController2 = SongController2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // systemOverlayStyle: Get.isDarkMode
            //     ? SystemUiOverlayStyle.light
            //     : SystemUiOverlayStyle.dark,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
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
            elevation: 0),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8)),
                          child: Obx(
                            () => Center(
                              child: Text(
                                timerCtl.pomodoroNum.value.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Pomodoro\n number',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                          key: const Key('pomodoro number'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8)),
                          child: Obx(
                            () => Center(
                              child: Text(
                                timerCtl.setNum.value.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Set',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                          key: const Key('set'),
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 125.0,
                          lineWidth: 8.0,
                          maskFilter:
                              const MaskFilter.blur(BlurStyle.solid, 8.0),
                          animation: true,
                          animationDuration: 1000,
                          animateFromLastPercent: true,
                          curve: Curves.linear,
                          percent: _getPomodoroPercentage(),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Obx(
                            () => Text(
                              _secondsToFormatedString(
                                  timerCtl.remainingTimer.value),
                              style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                                color: statusColor[timerCtl.pomodoroStatus],
                              ),
                            ),
                          ),
                          progressColor: statusColor[timerCtl.pomodoroStatus],
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProgressIcons(
                            total: pomodoriPerset,
                            done: timerCtl.pomodoroNum.value -
                                (timerCtl.setNum.value * pomodoriPerset)),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          statusDescription[timerCtl.pomodoroStatus],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Stack(
                            children: <Widget>[
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                left: timerCtl.showButtonReset.value
                                    ? 220
                                    : 130.8,
                                child: CustomButton(
                                  backgroundColorButton:
                                      Theme.of(context).primaryColor,
                                  elevationButton: 0,
                                  textColor: modeDark.value
                                      ? Colors.white54
                                      : Colors.black54,
                                  textButton: btnTextReset,
                                  onTap: () {
                                    _resetButtonPressed();
                                    timerCtl.setShowButtonReset(false);
                                  },
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                right: timerCtl.showButtonReset.value
                                    ? 220
                                    : 130.8,
                                child: CustomButton(
                                  key: const Key('start pomodoro'),
                                  textButton: timerCtl.mainBtnText.value,
                                  onTap: () {
                                    _mainButtonPressed();
                                    timerCtl.setShowButtonReset(true);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
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
      case PomodoroStatus.runningPomodoro:
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
      case PomodoroStatus.runningPomodoro:
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
    return percentage;
  }

  _startPomodoroWithoutDelay() {
    Timer.run(() {
      if (timerCtl.remainingTimer.value > 0) {
        timerCtl.removeDelayOfNotification.value--;
        timerCtl.remainingTimer.value--;
        timerCtl.setMainBtnText(btnTextPause);
      }
    });
  }

  _startPomodoroCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.runningPomodoro);
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
        timerCtl.setMainBtnText(btnTextPause);
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Iniciar pausa de 5 minutos');
        songController2.playSound();
        timerCtl.incrementPomodoroNum();
        _cancelTime();
        if (timerCtl.pomodoroNum.value % pomodoriPerset == 0) {
          timerCtl.setPomodoroStatus(PomodoroStatus.pausedLongBreak);
          timerCtl.setValueTimerNotification(
              timerCtl.currentSliderValueLongBreak.value);

          timerCtl.setRemainingTime(timerCtl.longBreakTimer.value);
          timerCtl.setMainBtnText(btnTextStartLongBreak);
        } else {
          timerCtl.setPomodoroStatus(PomodoroStatus.pausedShortBreak);
          timerCtl.setValueTimerNotification(
              timerCtl.currentSliderValueShortBreak.value);
          timerCtl.setRemainingTime(timerCtl.shortBreakTimer.value);
          timerCtl.setMainBtnText(btnTextStartShortBreak);
        }
      }
    });
  }

  _startShortBreak() {
    timerCtl.setPomodoroStatus(PomodoroStatus.runningShortBreak);
    timerCtl.setMainBtnText(btnTextPause);
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
        songController2.playSound();
        timerCtl
            .setValueTimerNotification(timerCtl.currentSliderValueWork.value);
        timerCtl.setRemainingTime(timerCtl.totalTimer.value);
        _cancelTime();
        timerCtl.setPomodoroStatus(PomodoroStatus.pausedPomodoro);
        timerCtl.setMainBtnText(btnTextStart);
      }
    });
  }

  _startLongBreak() {
    timerCtl.setPomodoroStatus(PomodoroStatus.runningLongBreak);
    timerCtl.setMainBtnText(btnTextPause);
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
        songController2.playSound();
        timerCtl
            .setValueTimerNotification(timerCtl.currentSliderValueWork.value);
        timerCtl.setRemainingTime(timerCtl.totalTimer.value);
        _cancelTime();
        timerCtl.setPomodoroStatus(PomodoroStatus.setFinished);
        timerCtl.setMainBtnText(btnTextStartNewSet);
      }
    });
  }

  _pausePomodoroCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.pausedPomodoro);
    _cancelTime();
    timerCtl.setMainBtnText(btnTextResumePomodoro);
  }

  _resetButtonPressed() {
    timerCtl.resetPomodoroNum();
    timerCtl.resetSetNum();
    _cancelTime();
    _stopCountdown();
  }

  _stopCountdown() {
    timerCtl.setPomodoroStatus(PomodoroStatus.pausedPomodoro);

    timerCtl.setMainBtnText(btnTextStart);
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
    timerCtl.setMainBtnText(btnTextResumeBreak);
  }

  _cancelTime() {
    timerCtl.timer.cancel();
  }
}
