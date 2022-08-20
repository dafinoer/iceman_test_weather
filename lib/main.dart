import 'package:flutter/material.dart';
import 'package:iceman_weather/main_config.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'iceman_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MainConfig.dev();
  final oneSignalNotification = OneSignal.shared;
  oneSignalNotification.setAppId(MainConfig.instance.notificationAppKey);
  runApp(const IcemanApp());
}
