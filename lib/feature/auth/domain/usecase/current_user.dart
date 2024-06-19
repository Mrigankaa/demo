import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/cubits/enities/user.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/usecase/usecase.dart';
import 'package:garagewa/feature/auth/domain/repo/auth_repo.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepo authRepo;
  const CurrentUser(this.authRepo);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepo.currentUser();
  }
}
