import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/intl_controller.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:pomodoro_app/responsive/dimensions.dart';
import 'package:pomodoro_app/screens/home_screen.dart';
import 'package:pomodoro_app/theme/themes_constants.dart';
import 'package:pomodoro_app/widgets/bottom_sheet_songs.dart';
import 'package:pomodoro_app/widgets/custom_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controllers/ux_controller.dart';
import '../model/settings_slide.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * floatingButtonHeight,
          width: MediaQuery.of(context).size.width * floatingButtonWidth,
          child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * borderFloatingButton)),
            label: Text(
              'Salvar',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height *
                      textSizeFloatingButton),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false);
              setIndexPage(0);

              resetPomodoroNum();
              resetSetNum();
              setPomodoroStatus(PomodoroStatus.pausedPomodoro);
              setValueTimerNotification(currentSliderValueWork.value);
              timer.value.cancel();

              setRemainingTime(totalTimer.value = currentSliderValueWork.value);

              setTotalTimer(currentSliderValueWork.value);

              setShortBreak(currentSliderValueShortBreak.value);
              setLongBreak(currentSliderValueLongBreak.value);

              setMainBtnText(AppLocalizations.of(context)!.startPomodoro);
              setShowButtonReset(false);
              switchSelectItemSong();
              choseIntl();
            },
          )),
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
        title: Text(AppLocalizations.of(context)!.settings),
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
                  Text(
                    AppLocalizations.of(context)!.modedark,
                    style: const TextStyle(
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
                        activeTrackColor: Colors.deepOrange[200],
                        activeColor: Colors.deepOrange,
                        onChanged: (value) {
                          modeDark.value = value;
                          navigationBarColor();
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
                child: ValueListenableBuilder(
                  valueListenable: chosenValueLanguage,
                  builder: (BuildContext context, value, Widget? child) {
                    return DropdownButton<String>(
                      underline: const SizedBox(),
                      dropdownColor: Theme.of(context).primaryColor,
                      alignment: AlignmentDirectional.center,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      value: chosenValueLanguage.value,
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
                      hint: Text(
                        AppLocalizations.of(context)!.pleaseChooseASong,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'OpenSans'),
                      ),
                      onChanged: (String? value) {
                        setChosenValueLanguage(value);
                      },
                    );
                  },
                ),
              ),
              const Divider(
                height: 30,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                AppLocalizations.of(context)!.work,
                style: const TextStyle(
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
              Text(
                AppLocalizations.of(context)!.shortBreak,
                style: const TextStyle(
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
              Text(
                AppLocalizations.of(context)!.longBreak,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
              const SizedBox(
                height: 100,
              )
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
