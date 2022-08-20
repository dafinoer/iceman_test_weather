abstract class ReactiveNotificationRepository {
  void onNotificationOpen();

  void onNotificationForeground();

  void close();
}
