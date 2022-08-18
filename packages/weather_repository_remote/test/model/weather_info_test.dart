import 'package:flutter_test/flutter_test.dart';
import 'package:weather_repository_remote/model/weather_info.dart';

void main() {
  group('Weather Info Test', () {
    final stubResponse = {
      'id': 721,
      'main': 'Haze',
      'description': 'haze',
      'icon': '50n'
    };

    test('Test stub json response', () {
      final result = WeatherInfo.fromJson(stubResponse);
      expect(result, isA<WeatherInfo>());
    });
  });
}
