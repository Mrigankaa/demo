import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/usecase/usecase.dart';
import 'package:garagewa/feature/home/domain/entities/services.dart';
import 'package:garagewa/feature/home/domain/entities/userdetails.dart';
import 'package:garagewa/feature/home/domain/usecase/fetch_services.dart';
import 'package:garagewa/feature/home/domain/usecase/getuser_details.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserDetails _getUserDetails;
  final FetchServices _fetchServices;

  HomeBloc(
      {required GetUserDetails userDetails,
      required FetchServices fetchServices})
      : _getUserDetails = userDetails,
        _fetchServices = fetchServices,
        super(HomeInitial()) {
    on<GetUserDetailsBloc>(_onGetUserDetails);
    on<GetServicesBloc>(_onGetServices);
  }
  void _onGetUserDetails(
    GetUserDetailsBloc event,
    Emitter<HomeState> emit,
  ) async {
    emit(UserDetailsLoading());
    final response =
        await _getUserDetails(UserDetailsParams(userId: event.userId));
    response.fold(
        (failure) => emit(
              GetUserDetailsFailure(failure.message),
            ), (userDetails) {
      emit(
        GetUserDetailsSuccess(userDetails),
      );
    });
  }

  void _onGetServices(
    GetServicesBloc event,
    Emitter<HomeState> emit,
  ) async {
    emit(UserDetailsLoading());
    final response = await _fetchServices(NoParams());
    response.fold(
        (failure) => emit(
              GetServiceFailure(failure.message),
            ), (service) {
      emit(
        GetSeviceSuccess(service),
      );
    });
  }
}
