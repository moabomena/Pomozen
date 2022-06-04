import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:pomodoro_app/screens/home_screen.dart';
import 'package:pomodoro_app/widgets/bottom_sheet_songs.dart';
import 'package:pomodoro_app/widgets/custom_slider.dart';

import '../model/settings_slide.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

const _btnTextStart = 'START POMODORO';

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  String? _chosenValueLanguage;
  // Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 60,
        width: 120,
        child: FloatingActionButton.extended(
          label: const Text(
            'Salvar',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            resetPomodoroNum();
            resetSetNum();
            setPomodoroStatus(PomodoroStatus.pausedPomodoro);
            setValueTimerNotification(currentSliderValueWork.value);
            timer.value.cancel();

            setRemainingTime(totalTimer.value = currentSliderValueWork.value);

            setTotalTimer(currentSliderValueWork.value);

            setShortBreak(currentSliderValueShortBreak.value);
            setLongBreak(currentSliderValueLongBreak.value);

            setMainBtnText(_btnTextStart);
            setShowButtonReset(false);
            switchSelectItemSong();
          },
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _resetSlider(ResetSlider.resetWork);
                _resetSlider(ResetSlider.resetShortBreak);
                _resetSlider(ResetSlider.resetLongBreak);
                _resetTextButtonSong();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
        title: const Text('Setting'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Modo dark',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: modeDark,
                    builder: (BuildContext context, value, Widget? child) {
                      return Switch(
                        value: modeDark.value,
                        splashRadius: 15,
                        activeTrackColor: Colors.grey[700],
                        activeColor: Colors.deepOrange,
                        onChanged: (value) {
                          modeDark.value = value;
                        },
                      );
                    },
                  )
                ],
              ),
              const Divider(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  dropdownColor: Theme.of(context).primaryColor,
                  alignment: AlignmentDirectional.center,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  value: _chosenValueLanguage,
                  elevation: 0,
                  items: <String>[
                    'English',
                    'Spanish',
                    'Portuguese',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.center,
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Please choose a language",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'OpenSans'),
                  ),
                  onChanged: (String? value) {
                    // TODO DEPOIS QUE APLICAR O valueNotifier REMOVE O SETstATE E TRANSFORMAR A CLASSE EM STATELESS
                    setState(() {
                      _chosenValueLanguage = value;
                    });
                  },
                ),
              ),
              const Divider(
                height: 30,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Work',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: currentSliderValueWork,
                builder: (BuildContext context, value, Widget? child) {
                  return SliderSettingsTimers(
                      activeTrackColor: Colors.red[700]!,
                      inactiveTrackColor: Colors.red[100]!,
                      thumbColor: Colors.redAccent,
                      overlayColor: Colors.red.withAlpha(32),
                      thumbRadius: 20,
                      slider: Slider(
                          value: currentSliderValueWork.value.toDouble(),
                          min: 1.0,
                          max: 60.0,
                          onChanged: (double value) {
                            setTimerWorkSlider(value.round());
                          }));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Short Break',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: currentSliderValueShortBreak,
                builder: (BuildContext context, value, Widget? child) {
                  return SliderSettingsTimers(
                    activeTrackColor: Colors.green[700]!,
                    inactiveTrackColor: Colors.green[100]!,
                    thumbColor: Colors.greenAccent,
                    overlayColor: Colors.green.withAlpha(32),
                    thumbRadius: 20,
                    slider: Slider(
                      value: currentSliderValueShortBreak.value.toDouble(),
                      min: 1.0,
                      max: 60.0,
                      onChanged: (double value) {
                        setTimerShortBreakSlider(value.round());
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Long Break',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              ValueListenableBuilder(
                valueListenable: currentSliderValueLongBreak,
                builder: (BuildContext context, value, Widget? child) {
                  return SliderSettingsTimers(
                      activeTrackColor: Colors.orange[700]!,
                      inactiveTrackColor: Colors.orange[100]!,
                      thumbColor: Colors.orangeAccent,
                      overlayColor: Colors.orange.withAlpha(32),
                      thumbRadius: 20,
                      slider: Slider(
                        value: currentSliderValueLongBreak.value.toDouble(),
                        min: 1.0,
                        max: 60.0,
                        onChanged: (double value) {
                          setTimerLongBreakSlider(value.round());
                        },
                      ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                height: 30,
              ),
              TextButton(
                child: ValueListenableBuilder(
                    valueListenable: textButtonSong,
                    builder:
                        (BuildContext context, String value, Widget? child) {
                      return Text(textButtonSong.value,
                          style: const TextStyle(fontFamily: 'OpenSans'));
                    }),
                onPressed: () => selectSongsBottomSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _resetSlider(var resetValueSlider) {
    switch (resetValueSlider) {
      case ResetSlider.resetWork:
        setTimerWorkSlider(totalTimer.value);
        break;
      case ResetSlider.resetShortBreak:
        setTimerShortBreakSlider(shortBreakTimer.value);
        break;
      case ResetSlider.resetLongBreak:
        setTimerLongBreakSlider(longBreakTimer.value);
        break;
      default:
    }
  }
}

_resetTextButtonSong() {
  switch (fileNameMusic.value) {
    case 'attention-bell-ding.mp3':
      textButtonSong.value = 'Attention bell ding';
      break;
    case 'bell-sound-with-delay.mp3':
      textButtonSong.value = 'Bell sound with delay';
      break;
    case 'bells-of-mystery.mp3':
      textButtonSong.value = 'Bells of mystery';
      break;
    case 'bike-bell-ring.mp3':
      textButtonSong.value = 'Bike bell ring';
      break;
    case 'cartoon-door-melodic-bell.mp3':
      textButtonSong.value = 'Cartoon door melodic bell';
      break;
    case 'clock-countdown-bleeps.mp3':
      textButtonSong.value = 'Clock countdown bleeps';
      break;
    case 'fairy-bells.mp3':
      textButtonSong.value = 'Fairy bells';
      break;
    case 'home-standard-ding-dong.mp3':
      textButtonSong.value = 'Home standard ding dong';
      break;
    case 'modern-classic-door-bell-sound.mp3':
      textButtonSong.value = 'Modern classic door bell';
      break;
    case 'notification-bell.mp3':
      textButtonSong.value = 'Notification bell';
      break;
    case 'service-bell-double-ding.mp3':
      textButtonSong.value = 'Service bell double ding';
      break;
    case 'small-door-bell.mp3':
      textButtonSong.value = 'Small door bell';
      break;
    case 'bell.mp3':
      textButtonSong.value = 'Bell';
      break;
    default:
  }
}
