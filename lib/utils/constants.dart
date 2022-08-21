import 'package:flutter/material.dart';
import 'package:Pomozen/model/pomodoro_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../model/select_songs.dart';

const pomodoriPerset = 4;

statusDescriptionFunc(BuildContext context, PomodoroStatus value) {
  Map<PomodoroStatus, dynamic> statusDescription = {
    PomodoroStatus.runningPomodoro:
        AppLocalizations.of(context)!.runningPomodoro,
    PomodoroStatus.pausedPomodoro: AppLocalizations.of(context)!.pausedPomodoro,
    PomodoroStatus.runningShortBreak:
        AppLocalizations.of(context)!.runningShortBreak,
    PomodoroStatus.pausedShortBreak:
        AppLocalizations.of(context)!.pausedShortBreak,
    PomodoroStatus.runningLongBreak:
        AppLocalizations.of(context)!.runningLongBreak,
    PomodoroStatus.pausedLongBreak:
        AppLocalizations.of(context)!.pausedLongBreak,
    PomodoroStatus.setFinished: AppLocalizations.of(context)!.setFinished,
  };
  return statusDescription[value];
}

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
