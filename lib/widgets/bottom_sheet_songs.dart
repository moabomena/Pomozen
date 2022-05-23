import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/utils/constants.dart';

import '../model/select_songs.dart';

final themeController = Get.find<ThemeController>();
final songController = Get.find<SongController>();
final AudioCache player = AudioCache();

void selectSongsBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            _listTileSelectSong(
              'Attention bell ding',
              keySong: 1,
              context: context,
              ontap: () {
                songController.selectMapItem(Songs.songOne);
                songController.setSongs(Songs.songOne);
                player.play(selectItemSong[Songs.songOne]);
                songController.setTextButtonSong('Attention bell ding');
              },
            ),
            _listTileSelectSong('Bell sound with delay',
                keySong: 2, context: context, ontap: () {
              songController.selectMapItem(Songs.songTwo);
              songController.setSongs(Songs.songTwo);
              player.play(selectItemSong[Songs.songTwo]);
              songController.setTextButtonSong('Bell sound with delay');
            }),
            _listTileSelectSong('Bells of mystery',
                keySong: 3, context: context, ontap: () {
              songController.selectMapItem(Songs.songThree);
              songController.setSongs(Songs.songThree);
              player.play(selectItemSong[Songs.songThree]);
              songController.setTextButtonSong('Bells of mystery');
            }),
            _listTileSelectSong('Bike bell ring', keySong: 4, context: context,
                ontap: () {
              songController.selectMapItem(Songs.songFour);
              songController.setSongs(Songs.songFour);
              player.play(selectItemSong[Songs.songFour]);
              songController.setTextButtonSong('Bike bell ring');
            }),
            _listTileSelectSong('Cartoon door melodic bell',
                keySong: 5, context: context, ontap: () {
              songController.selectMapItem(Songs.songFive);
              songController.setSongs(Songs.songFive);
              player.play(selectItemSong[Songs.songFive]);
              songController.setTextButtonSong('Cartoon door melodic bell');
            }),
            _listTileSelectSong('Clock Countdown bleeps',
                keySong: 6, context: context, ontap: () {
              songController.selectMapItem(Songs.songSix);
              songController.setSongs(Songs.songSix);
              player.play(selectItemSong[Songs.songSix]);
              songController.setTextButtonSong('Clock Countdown bleeps');
            }),
            _listTileSelectSong('Fairy bells', keySong: 7, context: context,
                ontap: () {
              songController.selectMapItem(Songs.songSeven);
              songController.setSongs(Songs.songSeven);
              player.play(selectItemSong[Songs.songSeven]);
              songController.setTextButtonSong('Fairy bells');
            }),
            _listTileSelectSong('Home standard ding dong',
                keySong: 8, context: context, ontap: () {
              songController.selectMapItem(Songs.songEight);
              songController.setSongs(Songs.songEight);
              player.play(selectItemSong[Songs.songEight]);
              songController.setTextButtonSong('Home standard ding dong');
            }),
            _listTileSelectSong('Modern classic door bell sound',
                keySong: 9, context: context, ontap: () {
              songController.selectMapItem(Songs.songNine);
              songController.setSongs(Songs.songNine);
              player.play(selectItemSong[Songs.songNine]);
              songController
                  .setTextButtonSong('Modern classic door bell sound');
            }),
            _listTileSelectSong('Notificaiton bell',
                keySong: 10, context: context, ontap: () {
              songController.selectMapItem(Songs.songTen);
              songController.setSongs(Songs.songTen);
              player.play(selectItemSong[Songs.songTen]);
              songController.setTextButtonSong('Notificaiton bell');
            }),
            _listTileSelectSong('Service bell double ding',
                keySong: 11, context: context, ontap: () {
              songController.selectMapItem(Songs.songEleven);
              songController.setSongs(Songs.songEleven);
              player.play(selectItemSong[Songs.songEleven]);
              songController.setTextButtonSong('Service bell double ding');
            }),
            _listTileSelectSong('Small door bell',
                keySong: 12, context: context, ontap: () {
              songController.selectMapItem(Songs.songTwelve);
              songController.setSongs(Songs.songTwelve);
              player.play(selectItemSong[Songs.songTwelve]);
              songController.setTextButtonSong('Small door bell');
            }),
            _listTileSelectSong('Bell', keySong: 13, context: context,
                ontap: () {
              songController.selectMapItem(Songs.songThirteen);
              songController.setSongs(Songs.songThirteen);
              player.play(selectItemSong[Songs.songThirteen]);
              songController.setTextButtonSong('Bell');
            }),
          ],
        );
      });
}

_listTileSelectSong(
  String title, {
  required VoidCallback ontap,
  required int keySong,
  required BuildContext context,
}) {
  return Obx(
    () => ListTile(
      leading: songController.mapSelectSong[keySong] == true
          ? Icon(
              Icons.check,
              color: Colors.greenAccent[700],
            )
          : const Icon(null),
      title: Text(
        title,
        style: TextStyle(
            color: songController.mapSelectSong[keySong] == true
                ? Colors.greenAccent[700]
                : Get.isDarkMode
                    ? Colors.white
                    : Colors.black,
            fontFamily: 'OpenSans'),
      ),
      trailing: songController.mapSelectSong[keySong] == true
          ? const Icon(Icons.pause_outlined)
          : const Icon(Icons.play_arrow_rounded),
      onTap: ontap,
    ),
  );
}

switchSelectItemSong() {
  switch (songController.songs) {
    case Songs.songOne:
      songController.setPlaySound('attention-bell-ding.mp3');
      break;
    case Songs.songTwo:
      songController.setPlaySound('bell-sound-with-delay.mp3');
      break;
    case Songs.songThree:
      songController.setPlaySound('bells-of-mystery.mp3');
      break;
    case Songs.songFour:
      songController.setPlaySound('bike-bell-ring.mp3');
      break;
    case Songs.songFive:
      songController.setPlaySound('cartoon-door-melodic-bell.mp3');
      break;
    case Songs.songSix:
      songController.setPlaySound('clock-countdown-bleeps.mp3');
      break;
    case Songs.songSeven:
      songController.setPlaySound('fairy-bells.mp3');
      break;
    case Songs.songEight:
      songController.setPlaySound('home-standard-ding-dong.mp3');
      break;
    case Songs.songNine:
      songController.setPlaySound('modern-classic-door-bell-sound.mp3');
      break;
    case Songs.songTen:
      songController.setPlaySound('notification-bell.mp3');
      break;
    case Songs.songEleven:
      songController.setPlaySound('service-bell-double-ding.mp3');
      break;
    case Songs.songTwelve:
      songController.setPlaySound('small-door-bell.mp3');
      break;
    case Songs.songThirteen:
      songController.setPlaySound('bell.mp3');
      break;
    default:
  }
}
