import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String simpleDateFormat() {
    final format = DateFormat.yMMMEd().format(this);
    return format;
  }

  String hourMinuteSecond() {
    final format = DateFormat('hh:mm a').format(this);
    return format;
  }
}
