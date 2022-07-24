import 'package:flutter/foundation.dart';

ValueNotifier<int> indexPage = ValueNotifier(0);
void setIndexPage(var newValue) => indexPage.value = newValue;
