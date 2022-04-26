import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/timer_controller.dart';

final timerController = Get.find<TimerController>();
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
        return Container(
          child: Wrap(
            children: <Widget>[
              _listTileSelectSong('Attention bell ding', keySong: 1, ontap: () {
                timerController.selectMapItem(Songs.songOne);
                timerController.setSongs(Songs.songOne);
                player.play(selectItemSong[Songs.songOne]);
                timerController.setTextButtonSong('Attention bell ding');
              }),
              _listTileSelectSong('Bell sound with delay', keySong: 2,
                  ontap: () {
                timerController.selectMapItem(Songs.songTwo);
                timerController.setSongs(Songs.songTwo);
                player.play(selectItemSong[Songs.songTwo]);
                timerController.setTextButtonSong('Bell sound with delay');
              }),
              _listTileSelectSong('Bells of mystery', keySong: 3, ontap: () {
                timerController.selectMapItem(Songs.songThree);
                timerController.setSongs(Songs.songThree);
                player.play(selectItemSong[Songs.songThree]);
                timerController.setTextButtonSong('Bells of mystery');
              }),
              _listTileSelectSong('Bike bell ring', keySong: 4, ontap: () {
                timerController.selectMapItem(Songs.songFour);
                timerController.setSongs(Songs.songFour);
                player.play(selectItemSong[Songs.songFour]);
                timerController.setTextButtonSong('Bike bell ring');
              }),
              _listTileSelectSong('Cartoon door melodic bell', keySong: 5,
                  ontap: () {
                timerController.selectMapItem(Songs.songFive);
                timerController.setSongs(Songs.songFive);
                player.play(selectItemSong[Songs.songFive]);
                timerController.setTextButtonSong('Cartoon door melodic bell');
              }),
              _listTileSelectSong('Clock Countdown bleeps', keySong: 6,
                  ontap: () {
                timerController.selectMapItem(Songs.songSix);
                timerController.setSongs(Songs.songSix);
                player.play(selectItemSong[Songs.songSix]);
                timerController.setTextButtonSong('Clock Countdown bleeps');
              }),
              _listTileSelectSong('Fairy bells', keySong: 7, ontap: () {
                timerController.selectMapItem(Songs.songSeven);
                timerController.setSongs(Songs.songSeven);
                player.play(selectItemSong[Songs.songSeven]);
                timerController.setTextButtonSong('Fairy bells');
              }),
              _listTileSelectSong('Home standard ding dong', keySong: 8,
                  ontap: () {
                timerController.selectMapItem(Songs.songEight);
                timerController.setSongs(Songs.songEight);
                player.play(selectItemSong[Songs.songEight]);
                timerController.setTextButtonSong('Home standard ding dong');
              }),
              _listTileSelectSong('Modern classic door bell sound', keySong: 9,
                  ontap: () {
                timerController.selectMapItem(Songs.songNine);
                timerController.setSongs(Songs.songNine);
                player.play(selectItemSong[Songs.songNine]);
                timerController
                    .setTextButtonSong('Modern classic door bell sound');
              }),
              _listTileSelectSong('Notificaiton bell', keySong: 10, ontap: () {
                timerController.selectMapItem(Songs.songTen);
                timerController.setSongs(Songs.songTen);
                player.play(selectItemSong[Songs.songTen]);
                timerController.setTextButtonSong('Notificaiton bell');
              }),
              _listTileSelectSong('Service bell double ding', keySong: 11,
                  ontap: () {
                timerController.selectMapItem(Songs.songEleven);
                timerController.setSongs(Songs.songEleven);
                player.play(selectItemSong[Songs.songEleven]);
                timerController.setTextButtonSong('Service bell double ding');
              }),
              _listTileSelectSong('Small door bell', keySong: 12, ontap: () {
                timerController.selectMapItem(Songs.songTwelve);
                timerController.setSongs(Songs.songTwelve);
                player.play(selectItemSong[Songs.songTwelve]);
                timerController.setTextButtonSong('Small door bell');
              }),
              _listTileSelectSong('Bell', keySong: 13, ontap: () {
                timerController.selectMapItem(Songs.songThirteen);
                timerController.setSongs(Songs.songThirteen);
                player.play(selectItemSong[Songs.songThirteen]);
                timerController.setTextButtonSong('Bell');
              }),
            ],
          ),
        );
      });
}

_listTileSelectSong(String title,
    {required VoidCallback ontap, required int keySong}) {
  return Obx(
    () => ListTile(
      leading: timerController.mapSelectSong[keySong] == true
          ? Icon(
              Icons.check,
              color: Colors.greenAccent[700],
            )
          : const Icon(null),
      title: Text(
        title,
        style: TextStyle(
            color: timerController.mapSelectSong[keySong] == true
                ? Colors.greenAccent[700]
                : Colors.black),
      ),
      trailing: timerController.mapSelectSong[keySong] == true
          ? const Icon(Icons.pause_outlined)
          : const Icon(Icons.play_arrow_rounded),
      onTap: ontap,
    ),
  );
}

enum Songs {
  songOne,
  songTwo,
  songThree,
  songFour,
  songFive,
  songSix,
  songSeven,
  songEight,
  songNine,
  songTen,
  songEleven,
  songTwelve,
  songThirteen
}

switchSelectItemSong() {
  switch (timerController.songs) {
    case Songs.songOne:
      timerController.setPlaySound('attention-bell-ding.mp3');
      break;
    case Songs.songTwo:
      timerController.setPlaySound('bell-sound-with-delay.mp3');
      break;
    case Songs.songThree:
      timerController.setPlaySound('bells-of-mystery.mp3');
      break;
    case Songs.songFour:
      timerController.setPlaySound('bike-bell-ring.mp3');
      break;
    case Songs.songFive:
      timerController.setPlaySound('cartoon-door-melodic-bell.mp3');
      break;
    case Songs.songSix:
      timerController.setPlaySound('clock-countdown-bleeps.mp3');
      break;
    case Songs.songSeven:
      timerController.setPlaySound('fairy-bells.mp3');
      break;
    case Songs.songEight:
      timerController.setPlaySound('home-standard-ding-dong.mp3');
      break;
    case Songs.songNine:
      timerController.setPlaySound('modern-classic-door-bell-sound.mp3');
      break;
    case Songs.songTen:
      timerController.setPlaySound('notification-bell.mp3');
      break;
    case Songs.songEleven:
      timerController.setPlaySound('service-bell-double-ding.mp3');
      break;
    case Songs.songTwelve:
      timerController.setPlaySound('small-door-bell.mp3');
      break;
    case Songs.songThirteen:
      timerController.setPlaySound('bell.mp3');
      break;
    default:
  }
}

const Map<Songs, dynamic> selectItemSong = {
  Songs.songOne: 'attention-bell-ding.mp3',
  Songs.songTwo: 'bell-sound-with-delay.mp3',
  Songs.songThree: 'bells-of-mystery.mp3',
  Songs.songFour: 'bike-bell-ring.mp3',
  Songs.songFive: 'cartoon-door-melodic-bell.mp3',
  Songs.songSix: 'clock-countdown-bleeps.mp3',
  Songs.songSeven: 'fairy-bells.mp3',
  Songs.songEight: 'home-standard-ding-dong.mp3',
  Songs.songNine: 'modern-classic-door-bell-sound.mp3',
  Songs.songTen: 'notification-bell.mp3',
  Songs.songEleven: 'service-bell-double-ding.mp3',
  Songs.songTwelve: 'small-door-bell.mp3',
  Songs.songThirteen: 'bell.mp3',
};
