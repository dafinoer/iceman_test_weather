import '../entity/weather.dart';

abstract class WeatherRepository {
  Future<List<Weather>> getWeathers(double lat, double lon);

  Future<Weather?> getWeather(double lat, double lon);
}
