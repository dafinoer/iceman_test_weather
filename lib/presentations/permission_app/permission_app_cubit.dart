import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_core/weather_core.dart';

part 'permission_app_state.dart';

class PermissionAppCubit extends Cubit<PermissionAppState> {
  final NotificationRepository _notificationRepository;

  PermissionAppCubit(this._notificationRepository)
      : super(const PermissionAppInitial());

  void onPromptNotification() async {
    try {
      emit(const PermissionAppLoading());
      await _notificationRepository.promptUserForNotificationPermission();
      emit(const PermissionAppGrant());
    } catch (e) {
      emit(const PermissionAppError());
    }
  }
}
