import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/exception/network_exception.dart';
import 'package:garagewa/feature/auth/data/datasource/auth_datasource.dart';
import 'package:garagewa/core/cubits/enities/user.dart';
import 'package:garagewa/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepoImplementation(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUser();
      if (user == null) {
        return left(
          Failure(""),
        );
      }
      return right(user);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final user = await authRemoteDataSource.loginWithEmailPassword(
          email: email, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
