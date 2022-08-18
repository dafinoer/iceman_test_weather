import 'package:flutter_test/flutter_test.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_repository_remote/model/temperature.dart'
    as temperature_service_model;

void main() {
  group('Temperature Stub test', () {
    final Map<String, dynamic> stubResult = {
      'temp': 26.05,
      'feels_like': 26.05,
      'temp_min': 23.67,
      'temp_max': 26.05,
      'pressure': 1010,
      'humidity': 83
    };

    test('Test mapping from Json', () {
      final result = temperature_service_model.Temperature.fromJson(stubResult);
      expect(result, isA<temperature_service_model.Temperature>());
    });

    test('Test uncomplate json', () {
      final result = temperature_service_model.Temperature.fromJson({});
      expect(result.tempMin, 0.0);
    });

    test('Test parse to Entity from object', () {
      final result = temperature_service_model.Temperature.fromJson(stubResult);
      expect(result.toEntity(), isA<Temperature>());
    });
  });
}
