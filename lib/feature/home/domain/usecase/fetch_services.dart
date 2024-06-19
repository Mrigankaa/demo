import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';
import 'package:garagewa/core/usecase/usecase.dart';
import 'package:garagewa/feature/home/domain/entities/services.dart';
import 'package:garagewa/feature/home/domain/repo/userdetails_repo.dart';

class FetchServices implements UseCase<List<Services?>, NoParams> {
  final UserDetailsRepo userDetailsRepo;
  const FetchServices(this.userDetailsRepo);
  @override
  Future<Either<Failure, List<Services?>>> call(NoParams params) {
    return userDetailsRepo.getServices();
  }
}
