import 'package:pomodoro_app/controllers/intl_controller.dart';
import 'package:pomodoro_app/services/prefs_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceIntl implements PrefsServiceInterface {
  static final String _keyIntl = 'intl';

  @override
  Future<void> read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    intl.value = prefs.getString(_keyIntl) ?? 'en';
  }

  @override
  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyIntl, intl.value);
  }
}
