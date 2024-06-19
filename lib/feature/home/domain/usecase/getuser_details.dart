import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/usecase/usecase.dart';
import 'package:garagewa/feature/home/domain/entities/userdetails.dart';
import 'package:garagewa/feature/home/domain/repo/userdetails_repo.dart';

class GetUserDetails implements UseCase<UserDetails, UserDetailsParams> {
  final UserDetailsRepo userDetailsRepo;
  const GetUserDetails(this.userDetailsRepo);

  @override
  Future<Either<Failure, UserDetails>> call(UserDetailsParams params) async {
    return await userDetailsRepo.getUserDetails(userId: params.userId);
  }
}

class UserDetailsParams {
  final String userId;
  UserDetailsParams({
    required this.userId,
  });
}
