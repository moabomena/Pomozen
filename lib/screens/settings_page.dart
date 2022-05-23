import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:pomodoro_app/widgets/bottom_sheet_songs.dart';
import 'package:pomodoro_app/widgets/custom_slider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

final timerController = Get.find<TimerController>();
final songController = Get.put(SongController());
final themeController = Get.put(ThemeController());
const _btnTextStart = 'START POMODORO';

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  String? _chosenValueLanguage;

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
            timerController.resetPomodoroNum();
            timerController.resetSetNum();
            timerController.timer.cancel();
            timerController.setPomodoroStatus(PomodoroStatus.pausedPomodoro);
            timerController.setValueTimerNotification(
                timerController.currentSliderValueWork.value);

            timerController.setRemainingTime(timerController.totalTimer.value =
                timerController.currentSliderValueWork.value);

            timerController
                .setTotalTimer(timerController.currentSliderValueWork.value);

            timerController.setShortBreak(
                timerController.currentSliderValueShortBreak.value);
            timerController.setLongBreak(
                timerController.currentSliderValueLongBreak.value);

            timerController.setMainBtnText(_btnTextStart);
            timerController.setShowButtonReset(false);
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
                  Obx(() => Switch(
                        value: themeController.isSwitchedDark.value,
                        splashRadius: 15,
                        activeTrackColor: Colors.grey[700],
                        activeColor: Colors.deepOrange,
                        onChanged: (value) {
                          themeController.setSwitchedDark(value);
                          Get.changeThemeMode(
                              themeController.isSwitchedDark.value
                                  ? ThemeMode.dark
                                  : ThemeMode.light);
                        },
                      ))
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
                    // TODO DEPOIS QUE APLICAR O GETX REMOVE O SETstATE E TRANSFORMAR A CLASSE EM STATELESS
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
              Obx(
                () => SliderSettingsTimers(
                    activeTrackColor: Colors.red[700]!,
                    inactiveTrackColor: Colors.red[100]!,
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    thumbRadius: 20,
                    slider: Slider(
                        value: timerController.currentSliderValueWork.value
                            .toDouble(),
                        min: 1.0,
                        max: 60.0,
                        onChanged: (double value) {
                          timerController.setTimerWorkSlider(value.round());
                        })),
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
              Obx(
                () => SliderSettingsTimers(
                  activeTrackColor: Colors.green[700]!,
                  inactiveTrackColor: Colors.green[100]!,
                  thumbColor: Colors.greenAccent,
                  overlayColor: Colors.green.withAlpha(32),
                  thumbRadius: 20,
                  slider: Slider(
                    value: timerController.currentSliderValueShortBreak.value
                        .toDouble(),
                    min: 1.0,
                    max: 60.0,
                    onChanged: (double value) {
                      timerController.setTimerShortBreakSlider(value.round());
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Long Break',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Obx(
                () => SliderSettingsTimers(
                    activeTrackColor: Colors.orange[700]!,
                    inactiveTrackColor: Colors.orange[100]!,
                    thumbColor: Colors.orangeAccent,
                    overlayColor: Colors.orange.withAlpha(32),
                    thumbRadius: 20,
                    slider: Slider(
                      value: timerController.currentSliderValueLongBreak.value
                          .toDouble(),
                      min: 1.0,
                      max: 60.0,
                      onChanged: (double value) {
                        timerController.setTimerLongBreakSlider(value.round());
                      },
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                height: 30,
              ),
              TextButton(
                child: Obx(() => Text(
                      songController.textButtonSong.value,
                      style: const TextStyle(fontFamily: 'OpenSans'),
                    )),
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
        timerController.setTimerWorkSlider(timerController.totalTimer.value);
        break;
      case ResetSlider.resetShortBreak:
        timerController
            .setTimerShortBreakSlider(timerController.shortBreakTimer.value);
        break;
      case ResetSlider.resetLongBreak:
        timerController
            .setTimerLongBreakSlider(timerController.longBreakTimer.value);
        break;
      default:
    }
  }
}

enum ResetSlider {
  resetWork,
  resetShortBreak,
  resetLongBreak,
}

_resetTextButtonSong() {
  switch (songController.fileNameMusic.value) {
    case 'attention-bell-ding.mp3':
      songController.textButtonSong.value = 'Attention bell ding';
      break;
    case 'bell-sound-with-delay.mp3':
      songController.textButtonSong.value = 'Bell sound with delay';
      break;
    case 'bells-of-mystery.mp3':
      songController.textButtonSong.value = 'Bells of mystery';
      break;
    case 'bike-bell-ring.mp3':
      songController.textButtonSong.value = 'Bike bell ring';
      break;
    case 'cartoon-door-melodic-bell.mp3':
      songController.textButtonSong.value = 'Cartoon door melodic bell';
      break;
    case 'clock-countdown-bleeps.mp3':
      songController.textButtonSong.value = 'Clock countdown bleeps';
      break;
    case 'fairy-bells.mp3':
      songController.textButtonSong.value = 'Fairy bells';
      break;
    case 'home-standard-ding-dong.mp3':
      songController.textButtonSong.value = 'Home standard ding dong';
      break;
    case 'modern-classic-door-bell-sound.mp3':
      songController.textButtonSong.value = 'Modern classic door bell';
      break;
    case 'notification-bell.mp3':
      songController.textButtonSong.value = 'Notification bell';
      break;
    case 'service-bell-double-ding.mp3':
      songController.textButtonSong.value = 'Service bell double ding';
      break;
    case 'small-door-bell.mp3':
      songController.textButtonSong.value = 'Small door bell';
      break;
    case 'bell.mp3':
      songController.textButtonSong.value = 'Bell';
      break;
    default:
  }
}
