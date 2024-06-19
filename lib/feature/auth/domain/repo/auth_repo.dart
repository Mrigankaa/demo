import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/cubits/enities/user.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
