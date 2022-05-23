import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/widgets/bottom_sheet_songs.dart';

class SongController extends GetxController {
  static AudioCache player = AudioCache();

  Songs songs = Songs.songThirteen;
  var fileNameMusic = 'bell.mp3'.obs;
  var textButtonSong = 'please choose a song'.obs;

  final mapSelectSong = {
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
  }.obs;

  @override
  void onInit() {
    player.load(fileNameMusic.value);
    super.onInit();
  }

  void setSongs(var value) {
    songs = value;
  }

  void playSound() {
    player.play(fileNameMusic.value);
  }

  void setPlaySound(var value) {
    fileNameMusic.value = value;
  }

  void setTextButtonSong(var value) {
    textButtonSong.value = value;
  }

  void selectMapItem(var value) {
    switch (value) {
      case Songs.songOne:
        mapSelectSong.update(1, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 1);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songTwo:
        mapSelectSong.update(2, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 2);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songThree:
        mapSelectSong.update(3, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 3);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songFour:
        mapSelectSong.update(4, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 4);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songFive:
        mapSelectSong.update(5, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 5);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songSix:
        mapSelectSong.update(6, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 6);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songSeven:
        mapSelectSong.update(7, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 7);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songEight:
        mapSelectSong.update(8, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 8);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songNine:
        mapSelectSong.update(9, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 9);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songTen:
        mapSelectSong.update(10, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 10);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songEleven:
        mapSelectSong.update(11, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 11);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songTwelve:
        mapSelectSong.update(12, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 12);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      case Songs.songThirteen:
        mapSelectSong.update(13, (value) => true);
        var result = mapSelectSong.keys.where((element) => element != 13);
        for (var item in result) {
          mapSelectSong.update(item, (value) => false);
        }
        break;
      default:
    }
  }
}
