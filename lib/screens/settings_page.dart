import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/timer_controller.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';
import 'package:pomodoro_app/widgets/custom_slider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

const _btnTextStart = 'START POMODORO';

class _SettingsPageState extends State<SettingsPage> {
  final timerController = Get.find<TimerController>();

  bool isSwitched = false;
  String? _chosenValueLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        label: const Text('Salvar'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          timerController
              .setLongBreak(timerController.currentSliderValueLongBreak.value);

          timerController.setMainBtnText(_btnTextStart);
          timerController.setShowButtonReset(false);
          switchSelectItemSong();
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _resetSlider(ResetSlider.resetWork);
                _resetSlider(ResetSlider.resetShortBreak);
                _resetSlider(ResetSlider.resetLongBreak);
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
        title: const Text('Setting'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 121, 119, 17),
      ),
      backgroundColor: Colors.yellow,
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isSwitched,
                    splashRadius: 15,
                    onChanged: (value) {
                      // TODO DEPOIS QUE APLICAR O GETX REMOVE O SETstATE E TRANSFORMAR A CLASSE EM STATELESS
                      setState(() {
                        isSwitched = value;
                        value = true;
                        // TODO CRIAR O CODIGO PARA O MODO DARK usando o getx
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  dropdownColor: Colors.grey[100],
                  alignment: AlignmentDirectional.center,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  value: _chosenValueLanguage,
                  elevation: 0,
                  style: const TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'English',
                    'Spanish',
                    'Portuguese',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Please choose a language",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    // TODO DEPOIS QUE APLICAR O GETX REMOVE O SETstATE E TRANSFORMAR A CLASSE EM STATELESS
                    setState(() {
                      _chosenValueLanguage = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Work',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
