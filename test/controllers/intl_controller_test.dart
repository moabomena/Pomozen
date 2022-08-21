import 'package:flutter_test/flutter_test.dart';
import 'package:Pomozen/controllers/intl_controller.dart';

void main() {
  test('test choose intl for en output', () {
    expect(intl.value, 'en');
  });
  test('test choose intl for pt output', () {
    setIntl('pt');

    expect(intl.value, 'pt');
  });
  test('test choose intl for es output ', () {
    setIntl('es');
    expect(intl.value, 'es');
  });
}
