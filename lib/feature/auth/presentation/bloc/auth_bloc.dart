import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:garagewa/core/cubits/app_user/app_user_cubit.dart';
import 'package:garagewa/core/cubits/enities/user.dart';
import 'package:garagewa/core/usecase/usecase.dart';
import 'package:garagewa/feature/auth/domain/usecase/current_user.dart';
import 'package:garagewa/feature/auth/domain/usecase/signin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc(
      {required UserLogin userLogin,
      required CurrentUser currentUser,
      required AppUserCubit appUserCubit})
      : _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLogedIn>(_isUserLogedIn);
  }

  void _isUserLogedIn(
    AuthIsUserLogedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _currentUser(NoParams());
    res.fold(
      (l) => emit(
        AuthFailuer(l.message),
      ),
      (r) {
        _emitAuthSuccess(r, emit);
      },
    );
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());
    final response = await _userLogin(UserLoginParam(
      email: event.email,
      password: event.password,
    ));
    response.fold((failure) => emit(AuthFailuer(failure.message)), (user) {
      _emitAuthSuccess(user, emit);
    });
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
