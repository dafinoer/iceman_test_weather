import 'package:json_annotation/json_annotation.dart';
import 'package:weather_core/entity/temperature.dart' as temperatur_weather;

part 'temperature.g.dart';

@JsonSerializable(checked: true)
class Temperature {
  @JsonKey(defaultValue: 0.0)
  final double temp;

  @JsonKey(defaultValue: 0.0)
  final double tempMin;

  @JsonKey(defaultValue: 0.0)
  final double tempMax;

  Temperature({
    required this.temp,
    required this.tempMax,
    required this.tempMin,
  });

  temperatur_weather.Temperature toEntity() => temperatur_weather.Temperature(
        tempMax: tempMax,
        tempMin: tempMin,
      );

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}
