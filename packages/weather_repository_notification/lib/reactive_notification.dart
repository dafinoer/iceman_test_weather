import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_core/repository/reactive_notification_repository.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class ReactiveNotification implements ReactiveNotificationRepository {
  final PublishSubject<dynamic> _publishSubject;
  final OneSignal _oneSignal;

  ReactiveNotification(this._publishSubject, this._oneSignal);

  Stream<dynamic> watchOpenNotification() => _publishSubject.stream
      .where((event) => event is OSNotificationOpenedResult);

  @override
  void close() {
    _publishSubject.close();
  }

  @override
  void onNotificationForeground() {
    _oneSignal.setNotificationWillShowInForegroundHandler((event) {
      _publishSubject.add(event.notification.jsonRepresentation());
    });
  }

  @override
  void onNotificationOpen() {
    _oneSignal.setNotificationOpenedHandler(
        (OSNotificationOpenedResult openedResult) {
      _publishSubject.add(openedResult);
      debugPrint('$openedResult');
    });
  }
}
