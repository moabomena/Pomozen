import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/model/select_songs.dart';

void main() {
  SongController songController = SongController();
  test('Value must be (bell.mp3)', () {
    expect(songController.fileNameMusic.value, 'bell.mp3'.obs);
  });

  test('The value of the textButtonSong should be (please choose a song)', () {
    expect(songController.textButtonSong.value, 'please choose a song'.obs);
  });
  test('total number of touches must be 13', () {
    expect(songController.mapSelectSong.length, 13);
  });

  test('select only one song', () {
    songController.selectMapItem(Songs.songTwo);
    expect(songController.mapSelectSong.containsKey(2),
        songController.mapSelectSong[2] == true);
  });
}
