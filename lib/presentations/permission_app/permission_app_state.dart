part of 'permission_app_cubit.dart';

abstract class PermissionAppState extends Equatable {
  const PermissionAppState();

  @override
  List<Object?> get props => [];
}

class PermissionAppInitial extends PermissionAppState {
  const PermissionAppInitial();

  @override
  List<Object?> get props => [];
}

class PermissionAppLoading extends PermissionAppState {
  const PermissionAppLoading();

  @override
  List<Object?> get props => [];
}

class PermissionAppMessage extends PermissionAppState {
  final String messagePermission;

  const PermissionAppMessage(this.messagePermission);

  @override
  List<Object?> get props => [messagePermission];
}

class PermissionAppGrant extends PermissionAppState {
  const PermissionAppGrant();
  @override
  List<Object?> get props => [];
}

class PermissionAppError extends PermissionAppState {
  const PermissionAppError();

  @override
  List<Object?> get props => [];
}
