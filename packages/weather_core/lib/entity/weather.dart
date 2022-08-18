import 'package:equatable/equatable.dart';

import 'temperature.dart';

class Weather extends Equatable {
  final String? name;
  final String? description;
  final String? iconPathName;
  final int? timestamp;
  final Weather? weather;
  final Temperature? temperature;

  Weather({
    this.name,
    this.description,
    this.iconPathName,
    this.timestamp,
    this.weather,
    this.temperature,
  });

  @override
  List<Object?> get props =>
      [name, description, iconPathName, timestamp, weather, temperature];

  DateTime? getDatetime() {
    final timestamp = this.timestamp;
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }
}
