abstract class NotificationRepository {
  Future<bool> promptUserForNotificationPermission();

  Future<String?> getUserId();

  void onSetLog() {
    return;
  }
}
