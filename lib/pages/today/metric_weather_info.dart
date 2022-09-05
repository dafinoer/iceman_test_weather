part of 'today_page.dart';

class CardMetricCurrentWeather extends StatelessWidget {
  const CardMetricCurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ColoredBox(
          color: theme.brightness == Brightness.light
              ? Colors.white
              : Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Constanta.assetPathThermometer,
                        color: theme.brightness == Brightness.light
                            ? Colors.black
                            : Colors.white),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('28${Constanta.degreeSymbol}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Text('Feels like',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Constanta.assetCloudIcon),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('88%',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Text('Humidity',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Constanta.assetTachometerIcon),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('1009hPa',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Text('Air Pressure',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
