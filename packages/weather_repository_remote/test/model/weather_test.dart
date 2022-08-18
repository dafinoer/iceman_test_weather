import 'package:flutter_test/flutter_test.dart';
import 'package:weather_core/entity/weather.dart';

import 'package:weather_repository_remote/model/weather.dart'
    as weather_service;

void main() {
  group('Weather Stub Test', () {
    final mockJsonResult = {
      "dt": 1660802400,
      "main": {
        "temp": 305.37,
        "feels_like": 307.2,
        "temp_min": 304.7,
        "temp_max": 305.37,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1008,
        "humidity": 47,
        "temp_kf": 0.67
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {"all": 22},
      "wind": {"speed": 3.47, "deg": 55, "gust": 4.62},
      "visibility": 10000,
      "pop": 0.01,
      "sys": {"pod": "d"},
      "dt_txt": "2022-08-18 06:00:00"
    };

    test('Test stub json response', () {
      final result = weather_service.Weather.fromJson(mockJsonResult);
      expect(result, isA<weather_service.Weather>());
      expect(result.toEntity(), isA<Weather>());
    });
  });
}
