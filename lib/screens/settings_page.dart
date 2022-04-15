import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/custom_slider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  double _currentSliderValueWork = 25;
  double _currentSliderValueShortBreak = 5;
  double _currentSliderValueLongBreak = 15;
  String? _chosenValueLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 121, 119, 17),
      ),
      backgroundColor: Colors.yellow,
      body: Container(
        padding: const EdgeInsets.all(12),
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
                    setState(() {
                      isSwitched = value;
                      value = true;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                )
              ],
            ),
            DropdownButton<String>(
              focusColor: Colors.white,
              borderRadius: BorderRadius.circular(16),
              dropdownColor: Colors.blueGrey[50],
              value: _chosenValueLanguage,
              elevation: 5,
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
                setState(() {
                  _chosenValueLanguage = value;
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Work',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SliderSettingsTimers(
              activeTrackColor: Colors.red[700]!,
              inactiveTrackColor: Colors.red[100]!,
              thumbColor: Colors.redAccent,
              overlayColor: Colors.red.withAlpha(32),
              thumbRadius: 20,
              slider: Slider(
                value: _currentSliderValueWork,
                min: 0,
                max: 60,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValueWork = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Short Break',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SliderSettingsTimers(
              activeTrackColor: Colors.green[700]!,
              inactiveTrackColor: Colors.green[100]!,
              thumbColor: Colors.greenAccent,
              overlayColor: Colors.green.withAlpha(32),
              thumbRadius: 20,
              slider: Slider(
                value: _currentSliderValueShortBreak,
                min: 0,
                max: 60,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValueShortBreak = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Long Break',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SliderSettingsTimers(
              activeTrackColor: Colors.orange[700]!,
              inactiveTrackColor: Colors.orange[100]!,
              thumbColor: Colors.orangeAccent,
              overlayColor: Colors.orange.withAlpha(32),
              thumbRadius: 20,
              slider: Slider(
                value: _currentSliderValueLongBreak,
                min: 0,
                max: 60,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValueLongBreak = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: TextButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
                      overlayColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 18, 96, 212)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
