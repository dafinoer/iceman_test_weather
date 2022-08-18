// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Temperature',
      json,
      ($checkedConvert) {
        final val = Temperature(
          temp: $checkedConvert('temp', (v) => (v as num?)?.toDouble() ?? 0.0),
          tempMax: $checkedConvert(
              'temp_max', (v) => (v as num?)?.toDouble() ?? 0.0),
          tempMin: $checkedConvert(
              'temp_min', (v) => (v as num?)?.toDouble() ?? 0.0),
        );
        return val;
      },
      fieldKeyMap: const {'tempMax': 'temp_max', 'tempMin': 'temp_min'},
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };
