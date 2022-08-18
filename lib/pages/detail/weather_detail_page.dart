import 'package:flutter/material.dart';
import 'package:iceman_weather/extensions/datetime_extension.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({
    Key? key,
    required this.descriptionWeather,
    required this.dateWeather,
    required this.tempMax,
    required this.tempMin,
    this.icon,
  }) : super(key: key);

  final DateTime dateWeather;
  final double tempMax;
  final double tempMin;
  final String? icon;
  final String descriptionWeather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Weather Detail')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 4.0),
                child: Text(dateWeather.simpleDateFormat(),
                    style: theme.textTheme.headline5
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
              Text(dateWeather.hourMinuteSecond(),
                  style: theme.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '$tempMax \u2103',
                        style: theme.textTheme.headline3
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (icon != null)
                      ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxHeight: 250.0,
                              maxWidth: 250.0,
                              minHeight: 125.0,
                              minWidth: 125.0),
                          child: Image.network(icon!, fit: BoxFit.contain))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child:
                    Text(descriptionWeather, style: theme.textTheme.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Temp(min)'),
                          Text('$tempMin \u2103',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Temp(max)'),
                          Text('$tempMax \u2103',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
