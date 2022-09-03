import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_repository_remote/forecast_weather_service.dart';

class DioMock extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  group('Forecast Repository With Mock', () {
    late DioMock dioMock;
    late ForecastWeatherService forecastService;
    late MockResponse mockResponse;

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

    final mockSingleWeather = {
      "dt": 1660802400,
      "main": {
        "temp": 305.37,
        "feels_like": 307.2,
        "temp_min": 304.7,
        "temp_max": 305.37,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1008,
        "humidity": 47,
        "temp_kf": 0.67
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {"all": 22},
      "wind": {"speed": 3.47, "deg": 55, "gust": 4.62},
      "visibility": 10000,
      "pop": 0.01,
      "sys": {"pod": "d"},
      "dt_txt": "2022-08-18 06:00:00"
    };

    setUp(() {
      dioMock = DioMock();
      forecastService = ForecastWeatherService(dioMock);
      mockResponse = MockResponse();
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

    test('Test get single weather', () async {
      when(() => dioMock.get(any(),
              queryParameters: {'lat': 0.0, 'lon': 0.0, 'units': 'metric'}))
          .thenAnswer(
        (invocation) async => Response(
            requestOptions: RequestOptions(path: ''), data: mockSingleWeather),
      );
      final result = await forecastService.getWeather(0.0, 0.0);
      expect(result, isA<Weather>());
    });

    test('Test get single weather with null', () async {
      when(() => mockResponse.data).thenReturn(<String, String>{});
      when(() => dioMock.get(any(),
              queryParameters: {'lat': 0.0, 'lon': 0.0, 'units': 'metric'}))
          .thenAnswer((_) async => mockResponse);
      await expectLater(
          forecastService.getWeather(0.0, 0.0), throwsA(isA<TypeError>()));
    });

    test('Test get single weather with dio error type', () async {
      when(() => mockResponse.requestOptions)
          .thenReturn(RequestOptions(path: ''));
      when(() => dioMock.get(any(),
              queryParameters: {'lat': 0.0, 'lon': 0.0, 'units': 'metric'}))
          .thenThrow(DioError(requestOptions: mockResponse.requestOptions, error: 500));
      await expectLater(forecastService.getWeather(0.0, 0.0), throwsA(isA<DioError>()));
    });

    tearDownAll(() {
      resetMocktailState();
    });
  });
}
