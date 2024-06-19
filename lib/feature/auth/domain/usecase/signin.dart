import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/usecase/usecase.dart';
import 'package:garagewa/core/cubits/enities/user.dart';
import 'package:garagewa/feature/auth/domain/repo/auth_repo.dart';

class UserLogin implements UseCase<User, UserLoginParam> {
  final AuthRepo authRepo;
  const UserLogin(this.authRepo);

  @override
  Future<Either<Failure, User>> call(UserLoginParam params) async {
    return await authRepo.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParam {
  final String email;
  final String password;
  UserLoginParam({required this.email, required this.password});
}
