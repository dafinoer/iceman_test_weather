import 'package:flutter/material.dart';
import 'package:iceman_weather/component/constanta.dart';

part 'card_current_weather_info.dart';

part 'metric_weather_info.dart';

part 'hourly_forecast.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CardCurrentWeatherInfo(),
        CardMetricCurrentWeather(),
        HourlyForecast()
      ],
    );
  }
}
