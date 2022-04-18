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

  String mainBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer? _timer;
  static int pomodoroNum = 0;
  static int setNum = 0;

  @override
  void initState() {
    player.load('bell.mp3');
    super.initState();
  }

  @override
  void dispose() {
    _cancelTime();
    super.dispose();
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
                Text(
                  'Pomodoro number: $pomodoroNum',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
                Text(
                  'set: $setNum',
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
                Expanded(
                  child: Column(
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
                        progressColor: statusColor[pomodoroStatus],
                        backgroundColor: Colors.red[100] as Color,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProgressIcons(
                          total: pomodoriPerset,
                          done: pomodoroNum - (setNum * pomodoriPerset)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        statusDescription[pomodoroStatus]!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          onTap: _mainButtonPressed, text: mainBtnText),
                      CustomButton(
                          onTap: _resetButtonPressed, text: _btnTextReset),
                    ],
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
    switch (pomodoroStatus) {
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
        setNum++;
        _startPomodoroCountdown();
        break;
    }
  }

  _getPomodoroPercentage() {
    int totalTime;
    switch (pomodoroStatus) {
      case PomodoroStatus.runingPomodoro:
        totalTime = timerCtl.currentSliderValueWork.value * 60;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = timerCtl.currentSliderValueWork.value * 60;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = timerCtl.currentSliderValueShortBreak.value * 60;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = timerCtl.currentSliderValueShortBreak.value * 60;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = timerCtl.currentSliderValueLongBreak.value * 60;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = timerCtl.currentSliderValueLongBreak.value * 60;
        break;
      case PomodoroStatus.setFinished:
        totalTime = timerCtl.currentSliderValueWork.value * 60;
        break;
    }
    double percentage = (totalTime - timerCtl.remainingTimer.value) / totalTime;
    return percentage;
  }

  _startPomodoroWithoutDelay() {
    Timer.run(() {
      if (timerCtl.remainingTimer.value > 0) {
        setState(() {
          timerCtl.removeDelayOfNotification.value--;
          timerCtl.remainingTimer.value--;
          mainBtnText = _btnTextPause;
        });
      }
    });
  }

  _startPomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.runingPomodoro;
    _startPomodoroWithoutDelay();
    _cancelTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCtl.remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: foque na tarefa',
            body: _secondsToFormatedString(
                timerCtl.removeDelayOfNotification.value));
        setState(() {
          timerCtl.removeDelayOfNotification.value--;
          timerCtl.remainingTimer.value--;
          mainBtnText = _btnTextPause;
        });
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Iniciar pausa de 5 minutos');
        _playSound();
        pomodoroNum++;
        _cancelTime();
        if (pomodoroNum % pomodoriPerset == 0) {
          pomodoroStatus = PomodoroStatus.pausedLongBreak;
          setState(() {
            timerCtl.setValueTimerNotification(
                timerCtl.currentSliderValueLongBreak.value);

            timerCtl
                .setRemainingTime(timerCtl.currentSliderValueLongBreak.value);
            mainBtnText = _btnTextStartLongBreak;
          });
        } else {
          pomodoroStatus = PomodoroStatus.pausedShortBreak;
          setState(() {
            timerCtl.setValueTimerNotification(
                timerCtl.currentSliderValueShortBreak.value);
            timerCtl
                .setRemainingTime(timerCtl.currentSliderValueShortBreak.value);
            mainBtnText = _btnTextStartShortBreak;
          });
        }
      }
    });
  }

  _startShortBreak() {
    pomodoroStatus = PomodoroStatus.runningShortBreak;
    setState(() {
      mainBtnText = _btnTextPause;
    });
    _startPomodoroWithoutDelay();
    _cancelTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCtl.remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: Descanse por 5 minutos',
            body: _secondsToFormatedString(
                timerCtl.removeDelayOfNotification.value));
        setState(() {
          timerCtl.removeDelayOfNotification.value--;
          timerCtl.remainingTimer.value--;
        });
      } else {
        localNotifications(
            title: 'Pomodoro: FINALIZADO!', body: 'Retorne ao trabalho!');
        _playSound();
        timerCtl
            .setValueTimerNotification(timerCtl.currentSliderValueWork.value);
        timerCtl.setRemainingTime(timerCtl.currentSliderValueWork.value);
        _cancelTime();
        pomodoroStatus = PomodoroStatus.pausedPomodoro;
        setState(() {
          mainBtnText = _btnTextStart;
        });
      }
    });
  }

  _startLongBreak() {
    pomodoroStatus = PomodoroStatus.runningLongBreak;
    setState(() {
      mainBtnText = _btnTextPause;
    });
    _startPomodoroWithoutDelay();
    _cancelTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCtl.remainingTimer.value > 0) {
        localNotifications(
            title: 'Pomodoro: Descanse por 15 minutos',
            body: _secondsToFormatedString(
                timerCtl.removeDelayOfNotification.value));
        setState(() {
          timerCtl.removeDelayOfNotification.value--;
          timerCtl.remainingTimer.value--;
        });
      } else {
        localNotifications(
            title: 'Pomodoro: CICLO FINALIZADO!',
            body: 'Inicie um novo ciclo!');
        _playSound();
        timerCtl
            .setValueTimerNotification(timerCtl.currentSliderValueWork.value);
        timerCtl.setRemainingTime(timerCtl.currentSliderValueWork.value);
        _cancelTime();
        pomodoroStatus = PomodoroStatus.setFinished;
        setState(() {
          mainBtnText = _btnTextStartNewSet;
        });
      }
    });
  }

  _pausePomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTime();
    setState(() {
      mainBtnText = _btnTextResumePomodoro;
    });
  }

  _resetButtonPressed() {
    pomodoroNum = 0;
    setNum = 0;
    _cancelTime();
    _stopCountdown();
  }

  _stopCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    setState(() {
      mainBtnText = _btnTextStart;
      timerCtl.setValueTimerNotification(timerCtl.currentSliderValueWork.value);
      timerCtl.setRemainingTime(timerCtl.currentSliderValueWork.value);
    });
  }

  _pauseShortBreakCountdown() {
    pomodoroStatus = PomodoroStatus.pausedShortBreak;
    _pauseBreakCountdown();
  }

  _pauseLongBreakCountdown() {
    pomodoroStatus = PomodoroStatus.pausedLongBreak;
    _pauseBreakCountdown();
  }

  _pauseBreakCountdown() {
    _cancelTime();
    setState(() {
      mainBtnText = _btnTextResumeBreak;
    });
  }

  _cancelTime() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  _playSound() {
    player.play('bell.mp3');
  }
}
