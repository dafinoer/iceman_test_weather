import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iceman_weather/presentations/home_weathers/home_weathers_cubit.dart';
import 'package:iceman_weather/presentations/notification/notification_cubit.dart';
import 'package:iceman_weather/presentations/permission_app/permission_app_cubit.dart';
import 'package:weather_repository_notification/weather_repository_notification.dart';
import 'package:weather_repository_remote/forecast_weather_service.dart';

import '../today/today_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeWeathersCubit _homeWeathersCubit;
  late final PermissionAppCubit _permissionAppCubit;
  late final NotificationCubit _notificationCubit;
  late final HomeWeathersCubit homeSingleWeatherCubit;

  @override
  void initState() {
    super.initState();
    _notificationCubit =
        NotificationCubit(context.read<ReactiveNotification>());
    _homeWeathersCubit =
        HomeWeathersCubit(context.read<ForecastWeatherService>());
    _permissionAppCubit =
        PermissionAppCubit(context.read<OneSignalNotificationRepository>());
    homeSingleWeatherCubit =
        HomeWeathersCubit(context.read<ForecastWeatherService>());

    _notificationCubit.onSetListenSubscription();
    _notificationCubit.onNotificationOpenHandler();
    _homeWeathersCubit.loadWeathers();
    _permissionAppCubit.onPromptNotification();
    homeSingleWeatherCubit.loadSingleWeather();
  }

  @override
  void dispose() {
    _homeWeathersCubit.close();
    _permissionAppCubit.close();
    _notificationCubit.close();
    homeSingleWeatherCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.brightness == Brightness.light
          ? Colors.grey[100]
          : theme.colorScheme.background,
      appBar: AppBar(title: const Text('Weather app'), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ]),
      body: MultiBlocListener(
        listeners: [
          BlocListener<NotificationCubit, NotificationState>(
            bloc: _notificationCubit,
            listener: (context, state) {
              if (state is NotificationOpenApp) {
                const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        ],
        child: const TodayPage(),
      ),
    );
  }
}
