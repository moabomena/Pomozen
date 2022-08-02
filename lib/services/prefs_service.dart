import 'package:pomodoro_app/controllers/intl_controller.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  bool themeDark = false;
  static final String _keyTheme = 'theme';
  static final String _keyIntl = 'intl';
  static final String _keyChosenLang = 'lang';

  readTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    modeDark.value = prefs.getBool(_keyTheme) ?? false;
  }

  setTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    modeDark.value == true
        ? await prefs.setBool(_keyTheme, modeDark.value)
        : await prefs.setBool(_keyTheme, modeDark.value);
  }

  readIntl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    intl.value = prefs.getString(_keyIntl) ?? 'en';
  }

  setInter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyIntl, intl.value);
  }

  readLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    chosenValueLanguage.value = prefs.getString(_keyChosenLang) ?? 'English';
  }

  setLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyChosenLang, chosenValueLanguage.value);
  }
}
