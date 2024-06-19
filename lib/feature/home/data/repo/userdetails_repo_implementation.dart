import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/exception/network_exception.dart';
import 'package:garagewa/feature/home/data/datasource/userdetails_datasource.dart';
import 'package:garagewa/feature/home/domain/entities/services.dart';
import 'package:garagewa/feature/home/domain/entities/userdetails.dart';
import 'package:garagewa/feature/home/domain/repo/userdetails_repo.dart';

class UserDetailsRepoImplementation implements UserDetailsRepo {
  final UserDetailsRemoteDataSource userDetailsRemoteDataSource;
  const UserDetailsRepoImplementation(this.userDetailsRemoteDataSource);
  @override
  Future<Either<Failure, UserDetails>> getUserDetails(
      {required String userId}) async {
    try {
      final userDetails =
          await userDetailsRemoteDataSource.getUserDetails(userId: userId);
      if (userDetails == null) {
        return left(
          Failure(""),
        );
      }
      return right(userDetails);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Services?>>> getServices() async {
    try {
      final services = await userDetailsRemoteDataSource.getServices();
      if (services.isEmpty) {
        return left(
          Failure("No Service Found"),
        );
      }
      return right(services);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }
}
