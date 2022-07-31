import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/responsive/dimensions.dart';
import 'package:pomodoro_app/utils/constants.dart';
import 'package:pomodoro_app/utils/notifications.dart';
import 'package:pomodoro_app/widgets/custom_button.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:pomodoro_app/screens/settings_screen.dart';
import 'package:pomodoro_app/widgets/drawer/custom_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/theme_controller.dart';
import '../widgets/progress_icons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static final songController2 = SongController2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(actions: [
          Builder(
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
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ], title: const Text('Pomodoro'), centerTitle: true, elevation: 0),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width *
                                widthPomodoroNumAndSetNum,
                            height: MediaQuery.of(context).size.height *
                                heightPomodoroNumAndSetNum,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height *
                                        borderRadiusIndicator)),
                            child: ValueListenableBuilder(
                              valueListenable: pomodoroNum,
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Center(
                                  child: Text(
                                    pomodoroNum.value.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                fontSizeIndicator,
                                        fontFamily: 'OpenSans'),
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.pomodoroNumber,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: MediaQuery.of(context).size.width *
                                    fontSizeTextIndicator),
                            key: const Key('pomodoro number'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width *
                                  widthPomodoroNumAndSetNum,
                              height: MediaQuery.of(context).size.height *
                                  heightPomodoroNumAndSetNum,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          borderRadiusIndicator)),
                              child: ValueListenableBuilder(
                                  valueListenable: setNum,
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return Center(
                                      child: Text(
                                        setNum.value.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                fontSizeIndicator,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    );
                                  })),
                          Text(
                            AppLocalizations.of(context)!.set,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: MediaQuery.of(context).size.width *
                                  fontSizeTextIndicator,
                            ),
                            key: const Key('set'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: remainingTimer,
                    builder: (BuildContext context, value, __) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ValueListenableBuilder(
                                  valueListenable: pomodoroStatus,
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return CircularPercentIndicator(
                                      // radius: 125.0,
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      lineWidth:
                                          MediaQuery.of(context).size.width *
                                              0.02,
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
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w400,
                                            color: statusColor[
                                                pomodoroStatus.value],
                                          )),
                                      progressColor:
                                          statusColor[pomodoroStatus.value],
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return SizedBox(
                                  height: 60,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        statusDescriptionFunc(context, value),
                                        textScaleFactor: MediaQuery.of(context)
                                                .size
                                                .width *
                                            textScaleFactorStatusDescription,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )),
                                );
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  heightSizedBox1,
                            ),
                            SizedBox(
                                // width: double.infinity,
                                height: MediaQuery.of(context).size.height *
                                    heightSizedBox2,
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      right: showButtonReset.value
                                          ? MediaQuery.of(context).size.width *
                                              animatedPositionedTrue
                                          : MediaQuery.of(context).size.width *
                                              animatedPositionedFalse,
                                      child: CustomButton(
                                        backgroundColorButton:
                                            Theme.of(context).primaryColor,
                                        elevationButton: 0,
                                        textColor: modeDark.value
                                            ? Colors.white54
                                            : Colors.black54,
                                        textButton:
                                            AppLocalizations.of(context)!.reset,
                                        onTap: () {
                                          _resetButtonPressed(context);
                                          setShowButtonReset(false);
                                        },
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: mainBtnText,
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return AnimatedPositioned(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          left: showButtonReset.value
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  animatedPositionedTrue
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  animatedPositionedFalse,
                                          child: CustomButton(
                                            key: const Key('start pomodoro'),
                                            textButton: mainBtnText.value,
                                            textColor: Colors.white,
                                            elevationButton:
                                                showButtonReset.value ? 6 : 0,
                                            onTap: () {
                                              _mainButtonPressed(context);
                                              setShowButtonReset(true);
                                            },
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ))
                          ]);
                    })
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

  _mainButtonPressed(BuildContext context) {
    switch (pomodoroStatus.value) {
      case PomodoroStatus.pausedPomodoro:
        _startPomodoroCountdown(context);
        break;
      case PomodoroStatus.runningPomodoro:
        _pausePomodoroCountdown(context);
        break;
      case PomodoroStatus.runningShortBreak:
        _pauseShortBreakCountdown(context);
        break;
      case PomodoroStatus.pausedShortBreak:
        _startShortBreak(context);
        break;
      case PomodoroStatus.runningLongBreak:
        _pauseLongBreakCountdown(context);
        break;
      case PomodoroStatus.pausedLongBreak:
        _startLongBreak(context);
        break;
      case PomodoroStatus.setFinished:
        incrementSetNum();
        _startPomodoroCountdown(context);
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

  _startPomodoroWithoutDelay(BuildContext context) {
    Timer.run(() {
      if (remainingTimer.value > 0) {
        removeDelayOfNotification.value--;
        remainingTimer.value--;
        setMainBtnText(AppLocalizations.of(context)!.pause);
      }
    });
  }

  _startPomodoroCountdown(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.runningPomodoro);
    _startPomodoroWithoutDelay(context);
    _cancelTime();
    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: foque na tarefa',
            body: _secondsToFormatedString(removeDelayOfNotification.value));
        removeDelayOfNotification.value--;
        remainingTimer.value--;
        setMainBtnText(AppLocalizations.of(context)!.pause);
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
          setMainBtnText(AppLocalizations.of(context)!.takeLongBreak);
        } else {
          setPomodoroStatus(PomodoroStatus.pausedShortBreak);
          setValueTimerNotification(currentSliderValueShortBreak.value);
          setRemainingTime(shortBreakTimer.value);
          setMainBtnText(AppLocalizations.of(context)!.takeShortBreak);
        }
      }
    });
  }

  _startShortBreak(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.runningShortBreak);
    setMainBtnText(AppLocalizations.of(context)!.pause);
    _startPomodoroWithoutDelay(context);
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
        setMainBtnText(AppLocalizations.of(context)!.startPomodoro);
      }
    });
  }

  _startLongBreak(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.runningLongBreak);
    setMainBtnText(AppLocalizations.of(context)!.pause);
    _startPomodoroWithoutDelay(context);
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
        setMainBtnText(AppLocalizations.of(context)!.startNewSet);
      }
    });
  }

  _pausePomodoroCountdown(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.pausedPomodoro);
    _cancelTime();
    setMainBtnText(AppLocalizations.of(context)!.resumePomodoro);
  }

  _resetButtonPressed(BuildContext context) {
    resetPomodoroNum();
    resetSetNum();
    _cancelTime();
    _stopCountdown(context);
  }

  _stopCountdown(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.pausedPomodoro);

    setMainBtnText(AppLocalizations.of(context)!.startPomodoro);
    setValueTimerNotification(currentSliderValueWork.value);
    setRemainingTime(totalTimer.value);
  }

  _pauseShortBreakCountdown(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.pausedShortBreak);
    _pauseBreakCountdown(context);
  }

  _pauseLongBreakCountdown(BuildContext context) {
    setPomodoroStatus(PomodoroStatus.pausedLongBreak);
    _pauseBreakCountdown(context);
  }

  _pauseBreakCountdown(BuildContext context) {
    _cancelTime();
    setMainBtnText(AppLocalizations.of(context)!.resumeBreak);
  }

  _cancelTime() {
    timer.value.cancel();
  }
}
