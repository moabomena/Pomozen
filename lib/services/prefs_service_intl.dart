import 'package:Pomozen/controllers/intl_controller.dart';
import 'package:Pomozen/services/prefs_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServiceIntl implements PrefsServiceInterface {
  static final String _keyIntl = 'intl';

  @override
  Future<void> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    intl.value = prefs.getString(_keyIntl) ?? 'en';
  }

  @override
  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyIntl, intl.value);
  }
}
