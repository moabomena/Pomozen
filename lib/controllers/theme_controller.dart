import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isSwitchedDark = false.obs;

  void setSwitchedDark(var value) {
    isSwitchedDark.value = value;
  }
}
