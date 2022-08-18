import 'package:test/test.dart';
import 'package:weather_core/entity/weather.dart';

void main() {
  group('Weather Entity Stub Tests', () {
    late final Weather weather;

    setUp(() {
      /// 2022-08-17 04:05:17
      weather = Weather(timestamp: 1660752317);
    });

    test('Test timestamp to date', () {
      expect(weather.getDatetime(), isA<DateTime>());
      expect(weather.getDatetime()?.day, 17);
    });
  });
}
