import 'package:flutter/foundation.dart';

ValueNotifier<String> chosenValueLanguage = ValueNotifier('English');

void setChosenValueLanguage(var newValue) =>
    chosenValueLanguage.value = newValue;
