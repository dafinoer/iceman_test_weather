import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iceman_weather/presentations/home_weathers/home_weathers_cubit.dart';
import 'package:iceman_weather/presentations/notification/notification_cubit.dart';
import 'package:iceman_weather/presentations/permission_app/permission_app_cubit.dart';
import 'package:weather_repository_notification/weather_repository_notification.dart';
import 'package:weather_repository_remote/forecast_weather_service.dart';
import 'package:iceman_weather/extensions/datetime_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeWeathersCubit _homeWeathersCubit;
  late final PermissionAppCubit _permissionAppCubit;
  late final NotificationCubit _notificationCubit;

  @override
  void initState() {
    super.initState();
    _notificationCubit =
        NotificationCubit(context.read<ReactiveNotification>());
    _homeWeathersCubit =
        HomeWeathersCubit(context.read<ForecastWeatherService>());
    _permissionAppCubit =
        PermissionAppCubit(context.read<OneSignalNotificationRepository>());

    _notificationCubit.onSetListenSubscription();
    _notificationCubit.onNotificationOpenHandler();
    _homeWeathersCubit.loadWeathers();
    _permissionAppCubit.onPromptNotification();
  }

  @override
  void dispose() {
    _homeWeathersCubit.close();
    _permissionAppCubit.close();
    _notificationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather app')),
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
          child: BlocBuilder<HomeWeathersCubit, HomeWeathersState>(
            bloc: _homeWeathersCubit,
            builder: (context, state) {
              if (state is HomeWeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeWeatherSuccess) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.weathers.length,
                  itemBuilder: (context, index) {
                    final date = state.weathers[index].getDatetime();
                    final weatherDesc =
                        state.weathers[index].weather?.description;
                    final temp = state.weathers[index].temperature;
                    final icon = state.weathers[index].weather?.iconPathName;

                    return ListTile(
                      onTap: () => Navigator.of(context).pushNamed('/detail',
                          arguments: state.weathers[index]),
                      leading: icon != null
                          ? Image.network(icon)
                          : const SizedBox.shrink(),
                      title: date != null
                          ? Text(
                              '${date.simpleDateFormat()} ${date.hourMinuteSecond()}')
                          : const SizedBox.shrink(),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (weatherDesc != null) Text(weatherDesc),
                          if (temp != null) Text('Temp: ${temp.tempMax}')
                        ],
                      ),
                      isThreeLine: true,
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
