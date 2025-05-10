import 'package:flutter_pokemon/common/usecase/usecase.dart';
import 'package:flutter_pokemon/core/data/repositories/pokemon_repository/pokemon_repository.dart';
import 'package:flutter_pokemon/core/error/failures.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_response_entity.dart';
import 'package:fpdart/fpdart.dart';

class GetPokemonList implements UseCase<PokemonSimpleResponseEntity, NoParams> {
  final PokemonRepository repository;
  GetPokemonList({required this.repository});

  @override
  Future<Either<Failure, PokemonSimpleResponseEntity>> call(
    NoParams params,
  ) async {
    return await repository.getPokemonList(limit: 500, offset: 0);
  }
}
