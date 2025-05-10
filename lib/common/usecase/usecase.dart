import 'package:flutter_pokemon/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// class NoParams extends Equatable {
class NoParams {
  @override
  List<Object> get props => [];
}
