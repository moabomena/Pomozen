import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:Pomozen/controllers/timer_controller.dart';

import 'package:Pomozen/main.dart' as app;
import 'package:Pomozen/widgets/custom_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('homePage E2E test', () {
    testWidgets('homeScreen elements', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      var descriptionPomodoroNumber = find
          .byKey(const Key('pomodoro number'))
          .evaluate()
          .single
          .widget as Text;

      var descriptionSet =
          find.byKey(const Key('set')).evaluate().single.widget as Text;

      expect(descriptionPomodoroNumber.data, equals("Pomodoro\n number"));
      expect(descriptionSet.data, equals("Set"));
    });
  });

  testWidgets('tap on button for starting pomodoro', (tester) async {
    app.main();
    // final timerController = Get.put(TimerController());
    setTotalTimer(1);
    setRemainingTime(1);
    await tester.pumpAndSettle();

    var button = find
        .byKey(const Key('start pomodoro'))
        .evaluate()
        .single
        .widget as CustomButton;

    expect(button.textButton, equals('START POMODORO'));

    await tester.tap(find.byKey(const Key('start pomodoro')));
    await tester.pumpAndSettle();
  });
}
