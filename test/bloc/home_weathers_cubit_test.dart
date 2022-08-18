import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iceman_weather/presentations/home_weathers/home_weathers_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_repository_remote/weather_repository_remote.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  group('Home Weathers Cubit Test', () {
    late HomeWeathersCubit homeWeathersCubit;
    late WeatherRepositoryMock weatherRepositoryMock;

    setUp(() {
      weatherRepositoryMock = WeatherRepositoryMock();
      homeWeathersCubit = HomeWeathersCubit(weatherRepositoryMock);
    });

    blocTest<HomeWeathersCubit, HomeWeathersState>(
      'Test Home Weather Cubit',
      setUp: () {
        when(() => weatherRepositoryMock.getWeathers(
                -6.175264434324154, 106.82716351126447))
            .thenAnswer((_) async => <Weather>[]);
      },
      build: () => homeWeathersCubit,
      act: (bloc) => bloc.loadWeathers(),
      expect: () => [const HomeWeatherLoading(), isA<HomeWeatherSuccess>()],
      verify: (bloc) {
        verify(() => weatherRepositoryMock.getWeathers(
            -6.175264434324154, 106.82716351126447)).called(1);
        verifyNoMoreInteractions(weatherRepositoryMock);
      },
    );

    blocTest<HomeWeathersCubit, HomeWeathersState>(
      'Test home weather cubit with exception',
      setUp: () {
        when(() => weatherRepositoryMock.getWeathers(
            -6.175264434324154, 106.82716351126447)).thenThrow(DioError);
      },
      build: () => homeWeathersCubit,
      act: (bloc) => bloc.loadWeathers(),
      expect: () => [const HomeWeatherLoading(), const HomeWeatherError()],
    );
  });
}
