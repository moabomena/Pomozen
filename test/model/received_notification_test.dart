import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/model/received_notification.dart';

void main() {
  ReceivedNotification receivedNotification = ReceivedNotification(
      id: 1, title: 'starting pomodoro', body: 'running task', payload: 'true');

  test('test class of NOtification', () {
    expect(receivedNotification.id, 1);
    expect(receivedNotification.title, 'starting pomodoro');
    expect(receivedNotification.body, 'running task');
    expect(receivedNotification.payload, 'true');
  });
}
