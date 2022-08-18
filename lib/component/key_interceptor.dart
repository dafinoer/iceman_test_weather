import 'package:weather_repository_remote/weather_repository_remote.dart';
import 'package:iceman_weather/main_config.dart';

class KeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final queryParam = options.queryParameters;
    queryParam.putIfAbsent('appid', () => MainConfig.instance.apiKey);
    options.queryParameters = queryParam;
    super.onRequest(options, handler);
  }
}
