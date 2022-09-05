part of 'today_page.dart';

class CardCurrentWeatherInfo extends StatelessWidget {
  const CardCurrentWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.0),
          child: ColoredBox(
            color: theme.brightness == Brightness.light
                ? Colors.blueAccent
                : Colors.black,
            child: Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        '12 july 2022 | 08:00 pm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '28',
                          style: theme.textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.w300, color: Colors.white),
                        ),
                        Text('\u2103',
                            style: theme.textTheme.headline5!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
