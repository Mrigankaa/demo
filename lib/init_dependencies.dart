import 'package:garagewa/core/cubits/app_user/app_user_cubit.dart';
import 'package:garagewa/core/services/dio.dart';
import 'package:garagewa/feature/auth/data/datasource/auth_datasource.dart';
import 'package:garagewa/feature/auth/data/repo/auth_repo_implementation.dart';
import 'package:garagewa/feature/auth/domain/repo/auth_repo.dart';
import 'package:garagewa/feature/auth/domain/usecase/current_user.dart';
import 'package:garagewa/feature/auth/domain/usecase/signin.dart';
import 'package:garagewa/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:garagewa/feature/home/data/datasource/userdetails_datasource.dart';
import 'package:garagewa/feature/home/data/repo/userdetails_repo_implementation.dart';
import 'package:garagewa/feature/home/domain/repo/userdetails_repo.dart';
import 'package:garagewa/feature/home/domain/usecase/fetch_services.dart';
import 'package:garagewa/feature/home/domain/usecase/getuser_details.dart';
import 'package:garagewa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final servicLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initGetUserDetails();
  final dioClient = HTTP();
  servicLocator.registerLazySingleton(() => dioClient);

  servicLocator.registerLazySingleton(
    () => AppUserCubit(),
  );
}

void _initAuth() {
  servicLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplementation(
        servicLocator(),
      ),
    )
    ..registerFactory<AuthRepo>(
      () => AuthRepoImplementation(
        servicLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        servicLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        servicLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
          currentUser: servicLocator(),
          userLogin: servicLocator(),
          appUserCubit: servicLocator()),
    );
}

void _initGetUserDetails() {
  servicLocator
    ..registerFactory<UserDetailsRemoteDataSource>(
      () => UserDetailsRemoteDataSourceImplementataion(
        servicLocator(),
      ),
    )
    ..registerFactory<UserDetailsRepo>(
      () => UserDetailsRepoImplementation(
        servicLocator(),
      ),
    )
    ..registerFactory(
      () => GetUserDetails(
        servicLocator(),
      ),
    )
    ..registerFactory(
      () => FetchServices(
        servicLocator(),
      ),
    )
    ..registerLazySingleton(
      () => HomeBloc(
        userDetails: servicLocator(),
        fetchServices: servicLocator(),
      ),
    );
}
