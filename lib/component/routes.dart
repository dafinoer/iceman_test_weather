import 'package:flutter/material.dart';
import 'package:iceman_weather/pages/detail/weather_detail_page.dart';
import 'package:weather_core/entity/weather.dart';

import '../pages/home/home_page.dart';

Map<String, WidgetBuilder> routes() {
  return {'/': (_) => const HomePage()};
}

Route<dynamic>? onGeneratedIcemanRoute(RouteSettings settings) {
  if (settings.name?.contains('/detail') ?? false) {
    final Weather weather = settings.arguments as Weather;
    final DateTime? dateTime = weather.getDatetime();
    final double temperatureMin = weather.temperature?.tempMin ?? 0.0;
    final double temperatureMax = weather.temperature?.tempMax ?? 0.0;
    final String? description = weather.weather?.description;
    final String? name = weather.weather?.name;
    final String? icon = weather.weather?.iconPathName;

    if (name != null && dateTime != null) {
      String compactDesc = name;
      if (description != null) compactDesc = '$name ($description)';
      return MaterialPageRoute(
        builder: (context) => WeatherDetailPage(
          descriptionWeather: compactDesc,
          dateWeather: dateTime,
          tempMax: temperatureMax,
          tempMin: temperatureMin,
          icon: icon,
        ),
      );
    }
  }
  return null;
}
