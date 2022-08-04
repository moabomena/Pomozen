import 'package:pomodoro_app/controllers/intl_controller.dart';
import 'package:pomodoro_app/services/prefs_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceLang implements PrefsServiceInterface {
  static final String _keyChosenLang = 'lang';

  @override
  Future<void> read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    chosenValueLanguage.value = prefs.getString(_keyChosenLang) ?? 'English';
  }

  @override
  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyChosenLang, chosenValueLanguage.value);
  }
}
