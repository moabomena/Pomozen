import 'package:flutter/foundation.dart';

ValueNotifier<bool> hasDrawer = ValueNotifier(false);
void setHasDrawer(var newValue) => hasDrawer.value = newValue;

ValueNotifier<int> indexPage = ValueNotifier(0);
void setIndexPage(var newValue) => indexPage.value = newValue;
