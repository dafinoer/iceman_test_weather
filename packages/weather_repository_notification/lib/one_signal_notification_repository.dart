
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:weather_core/repository/notification_repository.dart';

class OneSignalNotificationRepository implements NotificationRepository {
  final OneSignal oneSignal;

  OneSignalNotificationRepository(this.oneSignal) {
    onSetLog();
  }

  @override
  Future<bool> promptUserForNotificationPermission() =>
      oneSignal.promptUserForPushNotificationPermission();

  @override
  void onSetLog() {
    oneSignal.setLogLevel(OSLogLevel.verbose, OSLogLevel.error);
  }

  @override
  Future<String?> getUserId() async {
    final deviceStateValue = await oneSignal.getDeviceState();
    return deviceStateValue?.userId;
  }
}
