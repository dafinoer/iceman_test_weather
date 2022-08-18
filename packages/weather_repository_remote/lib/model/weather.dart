import 'package:json_annotation/json_annotation.dart';
import 'package:weather_core/entity/weather.dart' as weather_entity;
import 'temperature.dart';
import 'weather_info.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'dt')
  final int unixTimestamp;

  @JsonKey(name: 'main')
  final Temperature temperature;

  @JsonKey(name: 'weather')
  final List<WeatherInfo> weatherInfo;

  Weather({
    required this.temperature,
    required this.weatherInfo,
    required this.unixTimestamp,
  });

  weather_entity.Weather toEntity() {
    final weather_entity.Weather? weather =
        weatherInfo.isNotEmpty ? weatherInfo.first.toEntity() : null;

    return weather_entity.Weather(
      timestamp: unixTimestamp,
      temperature: temperature.toEntity(),
      weather: weather,
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
