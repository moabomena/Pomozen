import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/controllers/song_controller.dart';
import 'package:pomodoro_app/model/select_songs.dart';

void main() {
  test('Value must be (bell.mp3)', () {
    expect(fileNameMusic.value, 'bell.mp3');
  });

  test('The value of the textButtonSong should be (please choose a song)', () {
    expect(textButtonSong.value, 'please choose a song');
  });
  test('total number of touches must be 13', () {
    expect(mapSelectSong.value.length, 13);
  });

  test('select only one song', () {
    selectMapItem(Songs.songTwo);
    expect(mapSelectSong.value.containsKey(2), mapSelectSong.value[2] == true);
  });
}
