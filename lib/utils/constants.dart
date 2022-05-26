import 'package:flutter/material.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';

import '../model/select_songs.dart';

const pomodoriPerset = 4;

const Map<PomodoroStatus, dynamic> statusDescription = {
  PomodoroStatus.runningPomodoro: 'Pomodoro is running, time to be focused',
  PomodoroStatus.pausedPomodoro: 'Ready  for a focused pomodoro?',
  PomodoroStatus.runningShortBreak: 'Short break running, time to relax',
  PomodoroStatus.pausedShortBreak: 'Let\'s have  a short break?',
  PomodoroStatus.runningLongBreak: 'Long break running, time to relax',
  PomodoroStatus.pausedLongBreak: 'Let\'s have  a long break?',
  PomodoroStatus.setFinished:
      'Congrats, you deserve a long break, ready to start?',
};

const Map<PomodoroStatus, MaterialColor> statusColor = {
  PomodoroStatus.runningPomodoro: Colors.green,
  PomodoroStatus.pausedPomodoro: Colors.orange,
  PomodoroStatus.runningShortBreak: Colors.red,
  PomodoroStatus.pausedShortBreak: Colors.orange,
  PomodoroStatus.runningLongBreak: Colors.red,
  PomodoroStatus.pausedLongBreak: Colors.orange,
  PomodoroStatus.setFinished: Colors.orange,
};

const Map<Songs, dynamic> selectItemSong = {
  Songs.songOne: 'attention-bell-ding.mp3',
  Songs.songTwo: 'bell-sound-with-delay.mp3',
  Songs.songThree: 'bells-of-mystery.mp3',
  Songs.songFour: 'bike-bell-ring.mp3',
  Songs.songFive: 'cartoon-door-melodic-bell.mp3',
  Songs.songSix: 'clock-countdown-bleeps.mp3',
  Songs.songSeven: 'fairy-bells.mp3',
  Songs.songEight: 'home-standard-ding-dong.mp3',
  Songs.songNine: 'modern-classic-door-bell-sound.mp3',
  Songs.songTen: 'notification-bell.mp3',
  Songs.songEleven: 'service-bell-double-ding.mp3',
  Songs.songTwelve: 'small-door-bell.mp3',
  Songs.songThirteen: 'bell.mp3',
};

const btnTextStart = 'START \nPOMODORO';
const btnTextResumePomodoro = 'RESUME \nPOMODORO';
const btnTextResumeBreak = 'RESUME\n BREAK';
const btnTextStartShortBreak = 'TAKE \nSHORT BREAK';
const btnTextStartLongBreak = 'TAKE\n LONG BREAK';
const btnTextStartNewSet = 'START\n NEW SET';
const btnTextPause = 'PAUSE';
const btnTextReset = 'RESET';
