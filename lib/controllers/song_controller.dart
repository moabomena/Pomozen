import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../model/select_songs.dart';

final mapSelectSong = ValueNotifier<Map>({
  1: false,
  2: false,
  3: false,
  4: false,
  5: false,
  6: false,
  7: false,
  8: false,
  9: false,
  10: false,
  11: false,
  12: false,
  13: false,
});

ValueNotifier<String> textButtonSong = ValueNotifier('please choose a song');

ValueNotifier<String> fileNameMusic = ValueNotifier('bell.mp3');

void selectMapItem(var song) {
  switch (song) {
    case Songs.songOne:
      mapSelectSong.value.update(1, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 1);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songTwo:
      mapSelectSong.value.update(2, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 2);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songThree:
      mapSelectSong.value.update(3, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 3);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songFour:
      mapSelectSong.value.update(4, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 4);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songFive:
      mapSelectSong.value.update(5, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 5);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songSix:
      mapSelectSong.value.update(6, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 6);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songSeven:
      mapSelectSong.value.update(7, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 7);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songEight:
      mapSelectSong.value.update(8, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 8);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songNine:
      mapSelectSong.value.update(9, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 9);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songTen:
      mapSelectSong.value.update(10, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 10);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songEleven:
      mapSelectSong.value.update(11, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 11);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songTwelve:
      mapSelectSong.value.update(12, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 12);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    case Songs.songThirteen:
      mapSelectSong.value.update(13, (value) => true);
      var result = mapSelectSong.value.keys.where((element) => element != 13);
      for (var item in result) {
        mapSelectSong.value.update(item, (value) => false);
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      mapSelectSong.notifyListeners();
      break;
    default:
  }
}

Songs songs = Songs.songThirteen;
void setSongs(var newValue) => songs = newValue;

void setTextButtonSong(var newValue) => textButtonSong.value = newValue;

void setPlaySound(var newValue) => fileNameMusic.value = newValue;

class SongController2 {
  static AudioCache player = AudioCache();
  void playSound() => player.play(fileNameMusic.value);
}
