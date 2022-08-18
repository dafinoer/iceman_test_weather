import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iceman_weather/main_config.dart';
import 'package:weather_repository_remote/forecast_weather_service.dart';
import 'package:weather_repository_remote/provider/dio_provider.dart';

import 'component/key_interceptor.dart';
import 'component/routes.dart';

class IcemanApp extends StatelessWidget {
  const IcemanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            lazy: true,
            create: (context) => ForecastWeatherService(providerDio(
                    baseUrl: MainConfig.instance.baseUrl,
                    interceptors: [
                      KeyInterceptor(),
                    ])))
      ],
      child: MaterialApp(
        title: MainConfig.instance.title,
        routes: routes(),
        onGenerateRoute: onGeneratedIcemanRoute,
      ),
    );
  }
}
