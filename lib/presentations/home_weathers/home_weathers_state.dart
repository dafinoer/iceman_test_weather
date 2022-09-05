part of 'home_weathers_cubit.dart';

abstract class HomeWeathersState extends Equatable {
  const HomeWeathersState();
}

class HomeWeathersInitial extends HomeWeathersState {
  @override
  List<Object> get props => [];
}

class HomeWeatherLoading extends HomeWeathersState {
  const HomeWeatherLoading();

  @override
  List<Object?> get props => [];
}

class HomeWeatherSuccess extends HomeWeathersState {
  final List<Weather> weathers;

  const HomeWeatherSuccess(this.weathers);

  @override
  List<Object?> get props => [weathers];
}

class HomeSingleWeatherSucces extends HomeWeathersState {
  final Weather weather;

  const HomeSingleWeatherSucces(this.weather);

  @override
  List<Object?> get props => [weather];
}

class HomeWeatherError extends HomeWeathersState {
  const HomeWeatherError();

  @override
  List<Object?> get props => [];
}
