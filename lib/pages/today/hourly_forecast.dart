part of 'today_page.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hourly Forecast', style: theme.textTheme.titleLarge),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: size.width,
                maxWidth: size.width,
                minHeight: 100.0,
                maxHeight: 150.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ColoredBox(
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Now'),
                                  Image.asset(Constanta.assetCloudIcon),
                                  const Text('28')
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
