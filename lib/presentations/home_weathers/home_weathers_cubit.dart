import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_core/entity/weather.dart';
import 'package:weather_core/repository/weather_repository.dart';

part 'home_weathers_state.dart';

class HomeWeathersCubit extends Cubit<HomeWeathersState> {
  final WeatherRepository _forecastRepository;

  HomeWeathersCubit(this._forecastRepository) : super(HomeWeathersInitial());

  void loadWeathers() async {
    try {
      emit(const HomeWeatherLoading());
      const lat = -6.175264434324154;
      const lon = 106.82716351126447;
      final result = await _forecastRepository.getWeathers(lat, lon);
      emit(HomeWeatherSuccess(result));
    } catch (e) {
      emit(const HomeWeatherError());
    }
  }
}
