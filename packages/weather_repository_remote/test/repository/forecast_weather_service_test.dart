import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_repository_remote/forecast_weather_service.dart';

class DioMock extends Mock implements Dio {}

void main() {
  group('Forecast Repository With Mock', () {
    late DioMock dioMock;
    late ForecastWeatherService forecastService;

    final mockJsonResult = {
      'list': [
        {
          'id': 1631845,
          'dt': 1660634569,
          'name': 'Pecenongan',
          'timezone': 25200,
          'main': {'temp_min': 30.59, 'temp_max': 32.14},
          'weather': [
            {'id': 721, 'main': 'Haze', 'description': 'haze', 'icon': '50d'}
          ]
        },
      ]
    };

    setUp(() {
      dioMock = DioMock();
      forecastService = ForecastWeatherService(dioMock);
    });

    test('Test fetch forecast', () async {
      when(() => dioMock.get(any(), queryParameters: {
                'lat': 0.0,
                'lon': 0.0,
                'cnt': 16,
                'units': 'metric'
              }))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ''), data: mockJsonResult));
      final result = await forecastService.getWeathers(0.0, 0.0);
      verify(() => dioMock.get(any(), queryParameters: {
            'lat': 0.0,
            'lon': 0.0,
            'cnt': 16,
            'units': 'metric'
          })).called(1);
      verifyNoMoreInteractions(dioMock);

      expect(result.length, 1);
    });

    test('Test fetch forecast with exception', () async {
      when(() => dioMock.get(any(), queryParameters: {
                'lat': 0.0,
                'lon': 0.0,
                'cnt': 16,
                'units': 'metric'
              }))
          .thenThrow(DioError(
              requestOptions: RequestOptions(path: ''),
              type: DioErrorType.response));
      await expectLater(
          forecastService.getWeathers(0.0, 0.0), throwsA(isA<DioError>()));
    });

    test('Test un-complate json weather', () async {
      when(() => dioMock.get(any(), queryParameters: {
            'lat': 0.0,
            'lon': 0.0,
            'cnt': 16,
            'units': 'metric'
          })).thenAnswer(
        (_) async => Response(
            requestOptions: RequestOptions(path: ''), data: {'halo': 'hello'}),
      );
      await expectLater(
        forecastService.getWeathers(0.0, 0.0),
        throwsA(isA<MissingRequiredKeysException>()),
      );
    });

    tearDownAll(() {
      resetMocktailState();
    });
  });
}
