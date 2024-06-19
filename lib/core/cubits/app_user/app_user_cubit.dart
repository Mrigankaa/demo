import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/cubits/enities/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    emit(
      AppUserLoading(),
    );
    if (user == null) {
      emit(
        AppUserInitial(),
      );
    } else {
      emit(
        AppUserLoggdIn(user),
      );
    }
  }
}
