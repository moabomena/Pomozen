import 'package:flutter_test/flutter_test.dart';
import 'package:Pomozen/model/select_songs.dart';

void main() {
  test('the quantity must always be 13 of Songs', () {
    expect(Songs.values.length, 13);
  });
}
