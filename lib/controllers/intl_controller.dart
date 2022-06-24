import 'package:flutter/material.dart';

ValueNotifier<String> chosenValueLanguage = ValueNotifier('English');
ValueNotifier<String> intl = ValueNotifier('en');

void setChosenValueLanguage(var newValue) {
  chosenValueLanguage.value = newValue;
}

void setIntl(var newValue) {
  intl.value = newValue;
}

choseIntl() {
  switch (chosenValueLanguage.value) {
    case 'English':
      setIntl('en');
      break;
    case 'Spanish':
      setIntl('es');
      break;
    case 'Portuguese':
      setIntl('pt');
      break;
    default:
  }
}
