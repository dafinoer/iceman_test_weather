import 'package:json_annotation/json_annotation.dart';
import 'package:weather_core/entity/weather.dart' as weather_entity;

part 'weather_info.g.dart';

@JsonSerializable()
class WeatherInfo {
  final int id;
  final String main;

  @JsonKey(name: 'description')
  final String? desc;

  final String icon;

  WeatherInfo(this.id, this.main, this.icon, {this.desc});

  weather_entity.Weather toEntity() => weather_entity.Weather(
        name: main,
        description: desc,
        iconPathName: 'http://openweathermap.org/img/wn/$icon@2x.png',
      );

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}
