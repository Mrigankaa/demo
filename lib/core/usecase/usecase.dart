import 'package:fpdart/fpdart.dart';
import 'package:garagewa/core/exception/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
