import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/feature/home/domain/entities/services.dart';
import 'package:garagewa/feature/home/domain/entities/userdetails.dart';

abstract interface class UserDetailsRepo {
  Future<Either<Failure, UserDetails>> getUserDetails({
    required String userId,
  });
  Future<Either<Failure, List<Services?>>> getServices();
}
