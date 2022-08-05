import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/services/prefs_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceTheme implements PrefsServiceInterface {
  static final String _keyTheme = 'theme';

  @override
  Future<void> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    modeDark.value = prefs.getBool(_keyTheme) ?? false;
  }

  @override
  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    modeDark.value == true
        ? await prefs.setBool(_keyTheme, modeDark.value)
        : await prefs.setBool(_keyTheme, modeDark.value);
  }
}
