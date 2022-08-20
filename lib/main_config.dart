class MainConfig {
  final String title;
  final String baseUrl;
  final String apiKey;
  final String notificationAppKey;

  MainConfig({
    required this.title,
    required this.baseUrl,
    required this.apiKey,
    required this.notificationAppKey,
  });

  static late final MainConfig instance;

  factory MainConfig.dev() {
    instance = MainConfig(
        title: 'Iceman Weather',
        baseUrl: 'https://api.openweathermap.org',
        apiKey: '<api-key>',
      notificationAppKey: '<one-signal-appKey>',
    );
    return instance;
  }
}
