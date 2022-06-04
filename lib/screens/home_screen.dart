import 'dart:async';

import 'package:flutter/material.dart';
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
                          child: ValueListenableBuilder(
                            valueListenable: pomodoroNum,
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return Center(
                                child: Text(
                                  pomodoroNum.value.toString(),
                                  style: const TextStyle(
                                      fontSize: 20, fontFamily: 'OpenSans'),
                                ),
                              );
                            },
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
                            child: ValueListenableBuilder(
                                valueListenable: setNum,
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Center(
                                    child: Text(
                                      setNum.value.toString(),
                                      style: const TextStyle(
                                          fontSize: 20, fontFamily: 'OpenSans'),
                                    ),
                                  );
                                })),
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
                    child: ValueListenableBuilder(
                        valueListenable: remainingTimer,
                        builder: (BuildContext context, value, _) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: pomodoroStatus,
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return CircularPercentIndicator(
                                        radius: 125.0,
                                        lineWidth: 8.0,
                                        maskFilter: const MaskFilter.blur(
                                            BlurStyle.solid, 8.0),
                                        animation: true,
                                        animationDuration: 1000,
                                        animateFromLastPercent: true,
                                        curve: Curves.linear,
                                        percent: _getPomodoroPercentage(),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                            _secondsToFormatedString(
                                                remainingTimer.value),
                                            style: TextStyle(
                                              fontSize: 50,
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w600,
                                              color: statusColor[
                                                  pomodoroStatus.value],
                                            )),
                                        progressColor:
                                            statusColor[pomodoroStatus.value],
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                ProgressIcons(
                                    total: pomodoriPerset,
                                    done: pomodoroNum.value -
                                        (setNum.value * pomodoriPerset)),
                                const SizedBox(
                                  height: 60,
                                ),
                                ValueListenableBuilder<PomodoroStatus>(
                                  valueListenable: pomodoroStatus,
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Text(
                                      statusDescription[value],
                                    );
                                  },
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
                                          duration:
                                              const Duration(milliseconds: 300),
                                          left: showButtonReset.value
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
                                              setShowButtonReset(false);
                                            },
                                          ),
                                        ),
                                        ValueListenableBuilder(
                                          valueListenable: mainBtnText,
                                          builder: (BuildContext context, value,
                                              Widget? child) {
                                            return AnimatedPositioned(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              right: showButtonReset.value
                                                  ? 220
                                                  : 130.8,
                                              child: CustomButton(
                                                key:
                                                    const Key('start pomodoro'),
                                                textButton: mainBtnText.value,
                                                onTap: () {
                                                  _mainButtonPressed();
                                                  setShowButtonReset(true);
                                                },
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ))
                              ]);
                        })),
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
    switch (pomodoroStatus.value) {
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
        incrementSetNum();
        _startPomodoroCountdown();
        break;
    }
  }

  _getPomodoroPercentage() {
    int totalTime;
    switch (pomodoroStatus.value) {
      case PomodoroStatus.runningPomodoro:
        totalTime = totalTimer.value * 60;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = totalTimer.value * 60;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTimer.value * 60;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTimer.value * 60;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTimer.value * 60;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTimer.value * 60;
        break;
      case PomodoroStatus.setFinished:
        totalTime = totalTimer.value * 60;
        break;
    }
    double percentage = (totalTime - remainingTimer.value) / totalTime;
    return percentage;
  }

  _startPomodoroWithoutDelay() {
    Timer.run(() {
      if (remainingTimer.value > 0) {
        removeDelayOfNotification.value--;
        remainingTimer.value--;
        setMainBtnText(btnTextPause);
      }
    });
  }

  _startPomodoroCountdown() {
    setPomodoroStatus(PomodoroStatus.runningPomodoro);
    _startPomodoroWithoutDelay();
    _cancelTime();
    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: foque na tarefa',
            body: _secondsToFormatedString(removeDelayOfNotification.value));
        removeDelayOfNotification.value--;
        remainingTimer.value--;
        setMainBtnText(btnTextPause);
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Iniciar pausa de 5 minutos');
        Home.songController2.playSound();
        incrementPomodoroNum();
        _cancelTime();
        if (pomodoroNum.value % pomodoriPerset == 0) {
          setPomodoroStatus(PomodoroStatus.pausedLongBreak);
          setValueTimerNotification(currentSliderValueLongBreak.value);

          setRemainingTime(longBreakTimer.value);
          setMainBtnText(btnTextStartLongBreak);
        } else {
          setPomodoroStatus(PomodoroStatus.pausedShortBreak);
          setValueTimerNotification(currentSliderValueShortBreak.value);
          setRemainingTime(shortBreakTimer.value);
          setMainBtnText(btnTextStartShortBreak);
        }
      }
    });
  }

  _startShortBreak() {
    setPomodoroStatus(PomodoroStatus.runningShortBreak);
    setMainBtnText(btnTextPause);
    _startPomodoroWithoutDelay();
    _cancelTime();
    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: Descanse por 5 minutos',
            body: _secondsToFormatedString(removeDelayOfNotification.value));
        removeDelayOfNotification.value--;
        remainingTimer.value--;
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Retorne ao trabalho!');
        Home.songController2.playSound();
        setValueTimerNotification(currentSliderValueWork.value);
        setRemainingTime(totalTimer.value);
        _cancelTime();
        setPomodoroStatus(PomodoroStatus.pausedPomodoro);
        setMainBtnText(btnTextStart);
      }
    });
  }

  _startLongBreak() {
    setPomodoroStatus(PomodoroStatus.runningLongBreak);
    setMainBtnText(btnTextPause);
    _startPomodoroWithoutDelay();
    _cancelTime();
    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: Descanse por 15 minutos',
            body: _secondsToFormatedString(removeDelayOfNotification.value));
        removeDelayOfNotification.value--;
        remainingTimer.value--;
      } else {
        localNotifications(
            title: 'Pomodoro: CICLO FINALIZADO!',
            body: 'Inicie um novo ciclo!');
        Home.songController2.playSound();
        setValueTimerNotification(currentSliderValueWork.value);
        setRemainingTime(totalTimer.value);
        _cancelTime();
        setPomodoroStatus(PomodoroStatus.setFinished);
        setMainBtnText(btnTextStartNewSet);
      }
    });
  }

  _pausePomodoroCountdown() {
    setPomodoroStatus(PomodoroStatus.pausedPomodoro);
    _cancelTime();
    setMainBtnText(btnTextResumePomodoro);
  }

  _resetButtonPressed() {
    resetPomodoroNum();
    resetSetNum();
    _cancelTime();
    _stopCountdown();
  }

  _stopCountdown() {
    setPomodoroStatus(PomodoroStatus.pausedPomodoro);

    setMainBtnText(btnTextStart);
    setValueTimerNotification(currentSliderValueWork.value);
    setRemainingTime(totalTimer.value);
  }

  _pauseShortBreakCountdown() {
    setPomodoroStatus(PomodoroStatus.pausedShortBreak);
    _pauseBreakCountdown();
  }

  _pauseLongBreakCountdown() {
    setPomodoroStatus(PomodoroStatus.pausedLongBreak);
    _pauseBreakCountdown();
  }

  _pauseBreakCountdown() {
    _cancelTime();
    setMainBtnText(btnTextResumeBreak);
  }

  _cancelTime() {
    timer.value.cancel();
  }
}
