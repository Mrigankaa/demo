part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UserDetailsLoading extends HomeState {}

final class GetUserDetailsSuccess extends HomeState {
  final UserDetails userDetails;
  GetUserDetailsSuccess(this.userDetails);
}

final class GetUserDetailsFailure extends HomeState {
  final String message;
  GetUserDetailsFailure(this.message);
}

final class GetSeviceSuccess extends HomeState {
  final List<Services?> services;
  GetSeviceSuccess(this.services);
}

final class GetServiceFailure extends HomeState {
  final String message;
  GetServiceFailure(this.message);
}
