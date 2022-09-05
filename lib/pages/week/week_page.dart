import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iceman_weather/extensions/datetime_extension.dart';

import '../../presentations/home_weathers/home_weathers_cubit.dart';

class WeekPage extends StatelessWidget {
  const WeekPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeWeathersCubit, HomeWeathersState>(
      builder: (context, state) {
        if (state is HomeWeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeWeatherSuccess) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.weathers.length,
            itemBuilder: (context, index) {
              final date = state.weathers[index].getDatetime();
              final weatherDesc = state.weathers[index].weather?.description;
              final temp = state.weathers[index].temperature;
              final icon = state.weathers[index].weather?.iconPathName;

              return ListTile(
                  onTap: () => Navigator.of(context)
                      .pushNamed('/detail', arguments: state.weathers[index]),
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
                  isThreeLine: true);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
