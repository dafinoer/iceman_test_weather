class MainConfig {
  final String title;
  final String baseUrl;
  final String apiKey;

  MainConfig({
    required this.title,
    required this.baseUrl,
    required this.apiKey,
  });

  static late final MainConfig instance;

  factory MainConfig.dev() {
    instance = MainConfig(
        title: 'Iceman Weather',
        baseUrl: 'https://api.openweathermap.org',
        apiKey: '<api-key>');
    return instance;
  }
}
