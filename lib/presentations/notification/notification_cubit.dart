import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository_notification/weather_repository_notification.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final ReactiveNotification reactiveNotification;
  late final StreamSubscription _streamSubscription;

  NotificationCubit(this.reactiveNotification)
      : super(const NotificationInitial());

  void onSetListenSubscription() {
    _streamSubscription =
        reactiveNotification.watchOpenNotification().listen((event) {
      emit(const NotificationOpenApp());
    });
  }

  void onNotificationOpenHandler() {
    reactiveNotification.onNotificationOpen();
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    reactiveNotification.close();
    return super.close();
  }
}
