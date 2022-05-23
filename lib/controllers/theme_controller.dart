import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isSwitchedDark = false.obs;

  @override
  void onInit() {
    if (Get.isDarkMode) {
      setSwitchedDark(true);
    }
    super.onInit();
  }

  void setSwitchedDark(var value) {
    isSwitchedDark.value = value;
  }
}
