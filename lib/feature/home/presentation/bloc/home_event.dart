part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class GetUserDetailsBloc extends HomeEvent {
  final String userId;
  GetUserDetailsBloc({
    required this.userId,
  });
}

final class GetServicesBloc extends HomeEvent {}
