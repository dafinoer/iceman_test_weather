import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_core/weather_core.dart';
import 'model/weather.dart' as weather_forecast;

class ForecastWeatherService implements WeatherRepository {
  final Dio dio;

  ForecastWeatherService(this.dio);

  @override
  Future<List<Weather>> getWeathers(double lat, double lon) async {
    final response = await dio.get('/data/2.5/forecast', queryParameters: {
      'lat': lat,
      'lon': lon,
      'cnt': 16,
      'units': 'metric'
    });
    final Map<String, dynamic> resultJson = response.data;
    if (!resultJson.containsKey('list') && resultJson['list'] == null) {
      throw MissingRequiredKeysException(['list'], resultJson);
    }
    final results = UnmodifiableListView(response.data['list'])
        .map((e) => weather_forecast.Weather.fromJson(e))
        .toList();
    final weathers = results.map((e) => e.toEntity()).toList(growable: false);

    return weathers;
  }

  @override
  Future<Weather?> getWeather(double lat, double lon) async => null;
}
