import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/utils/constants.dart';

import '../controllers/theme_controller.dart';
import '../model/select_songs.dart';

final AudioCache player = AudioCache();

void selectSongsBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(24), topLeft: Radius.circular(24)),
    ),
    builder: (BuildContext bc) {
      return Wrap(
        children: <Widget>[
          listTileSelectSong(
            'Attention bell ding',
            keySong: 1,
            context: bc,
            ontap: () {
              selectMapItem(Songs.songOne);
              setSongs(Songs.songOne);
              player.play(selectItemSong[Songs.songOne]);
              setTextButtonSong('Attention bell ding');
            },
          ),
          listTileSelectSong('Bell sound with delay', keySong: 2, context: bc,
              ontap: () {
            selectMapItem(Songs.songTwo);
            setSongs(Songs.songTwo);
            player.play(selectItemSong[Songs.songTwo]);
            setTextButtonSong('Bell sound with delay');
          }),
          listTileSelectSong('Bells of mystery', keySong: 3, context: bc,
              ontap: () {
            selectMapItem(Songs.songThree);
            setSongs(Songs.songThree);
            player.play(selectItemSong[Songs.songThree]);
            setTextButtonSong('Bells of mystery');
          }),
          listTileSelectSong('Bike bell ring', keySong: 4, context: bc,
              ontap: () {
            selectMapItem(Songs.songFour);
            setSongs(Songs.songFour);
            player.play(selectItemSong[Songs.songFour]);
            setTextButtonSong('Bike bell ring');
          }),
          listTileSelectSong('Cartoon door melodic bell',
              keySong: 5, context: bc, ontap: () {
            selectMapItem(Songs.songFive);
            setSongs(Songs.songFive);
            player.play(selectItemSong[Songs.songFive]);
            setTextButtonSong('Cartoon door melodic bell');
          }),
          listTileSelectSong('Clock Countdown bleeps', keySong: 6, context: bc,
              ontap: () {
            selectMapItem(Songs.songSix);
            setSongs(Songs.songSix);
            player.play(selectItemSong[Songs.songSix]);
            setTextButtonSong('Clock Countdown bleeps');
          }),
          listTileSelectSong('Fairy bells', keySong: 7, context: bc, ontap: () {
            selectMapItem(Songs.songSeven);
            setSongs(Songs.songSeven);
            player.play(selectItemSong[Songs.songSeven]);
            setTextButtonSong('Fairy bells');
          }),
          listTileSelectSong('Home standard ding dong', keySong: 8, context: bc,
              ontap: () {
            selectMapItem(Songs.songEight);
            setSongs(Songs.songEight);
            player.play(selectItemSong[Songs.songEight]);
            setTextButtonSong('Home standard ding dong');
          }),
          listTileSelectSong('Modern classic door bell sound',
              keySong: 9, context: bc, ontap: () {
            selectMapItem(Songs.songNine);
            setSongs(Songs.songNine);
            player.play(selectItemSong[Songs.songNine]);
            setTextButtonSong('Modern classic door bell sound');
          }),
          listTileSelectSong('Notificaiton bell', keySong: 10, context: bc,
              ontap: () {
            selectMapItem(Songs.songTen);
            setSongs(Songs.songTen);
            player.play(selectItemSong[Songs.songTen]);
            setTextButtonSong('Notificaiton bell');
          }),
          listTileSelectSong('Service bell double ding',
              keySong: 11, context: bc, ontap: () {
            selectMapItem(Songs.songEleven);
            setSongs(Songs.songEleven);
            player.play(selectItemSong[Songs.songEleven]);
            setTextButtonSong('Service bell double ding');
          }),
          listTileSelectSong('Small door bell', keySong: 12, context: bc,
              ontap: () {
            selectMapItem(Songs.songTwelve);
            setSongs(Songs.songTwelve);
            player.play(selectItemSong[Songs.songTwelve]);
            setTextButtonSong('Small door bell');
          }),
          listTileSelectSong('Bell', keySong: 13, context: bc, ontap: () {
            selectMapItem(Songs.songThirteen);
            setSongs(Songs.songThirteen);
            player.play(selectItemSong[Songs.songThirteen]);
            setTextButtonSong('Bell');
          }),
        ],
      );
    },
    context: context,
  );
}

switchSelectItemSong() {
  switch (songs) {
    case Songs.songOne:
      setPlaySound('attention-bell-ding.mp3');
      break;
    case Songs.songTwo:
      setPlaySound('bell-sound-with-delay.mp3');
      break;
    case Songs.songThree:
      setPlaySound('bells-of-mystery.mp3');
      break;
    case Songs.songFour:
      setPlaySound('bike-bell-ring.mp3');
      break;
    case Songs.songFive:
      setPlaySound('cartoon-door-melodic-bell.mp3');
      break;
    case Songs.songSix:
      setPlaySound('clock-countdown-bleeps.mp3');
      break;
    case Songs.songSeven:
      setPlaySound('fairy-bells.mp3');
      break;
    case Songs.songEight:
      setPlaySound('home-standard-ding-dong.mp3');
      break;
    case Songs.songNine:
      setPlaySound('modern-classic-door-bell-sound.mp3');
      break;
    case Songs.songTen:
      setPlaySound('notification-bell.mp3');
      break;
    case Songs.songEleven:
      setPlaySound('service-bell-double-ding.mp3');
      break;
    case Songs.songTwelve:
      setPlaySound('small-door-bell.mp3');
      break;
    case Songs.songThirteen:
      setPlaySound('bell.mp3');
      break;
    default:
  }
}

listTileSelectSong(
  String title, {
  required VoidCallback ontap,
  required int keySong,
  required BuildContext context,
}) {
  return ValueListenableBuilder(
      valueListenable: mapSelectSong,
      builder: (BuildContext context, value, Widget? child) {
        return ListTile(
          tileColor: modeDark.value ? Colors.black45 : Colors.white38,
          leading: mapSelectSong.value[keySong] == true
              ? Icon(
                  Icons.check,
                  color: Colors.greenAccent[700],
                )
              : const Icon(null),
          title: Text(
            title,
            style: TextStyle(
                color: mapSelectSong.value[keySong] == true
                    ? Colors.greenAccent[700]
                    : modeDark.value
                        ? Colors.white
                        : Colors.black,
                fontFamily: 'OpenSans'),
          ),
          trailing: mapSelectSong.value[keySong] == true
              ? const Icon(Icons.pause_outlined)
              : const Icon(Icons.play_arrow_rounded),
          onTap: ontap,
        );
      });
}
