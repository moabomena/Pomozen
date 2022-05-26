import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/model/pomodoro_status.dart';

void main() {
  test('always return 7 elements of PomodoroStatus', () {
    expect(PomodoroStatus.values.length, 7);
  });

  test('return the exact value of String of the pomodoroStatus', () {
    expect(PomodoroStatus.values.byName('runningPomodoro'),
        PomodoroStatus.runningPomodoro);

    expect(PomodoroStatus.values.byName('pausedPomodoro'),
        PomodoroStatus.pausedPomodoro);

    expect(PomodoroStatus.values.byName('runningShortBreak'),
        PomodoroStatus.runningShortBreak);

    expect(PomodoroStatus.values.byName('pausedShortBreak'),
        PomodoroStatus.pausedShortBreak);

    expect(PomodoroStatus.values.byName('runningLongBreak'),
        PomodoroStatus.runningLongBreak);

    expect(PomodoroStatus.values.byName('pausedLongBreak'),
        PomodoroStatus.pausedLongBreak);

    expect(PomodoroStatus.values.byName('setFinished'),
        PomodoroStatus.setFinished);
  });
}
