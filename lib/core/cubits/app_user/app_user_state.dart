part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggdIn extends AppUserInitial {
  final User user;
  AppUserLoggdIn(this.user);
}

final class AppUserLoading extends AppUserState {}
