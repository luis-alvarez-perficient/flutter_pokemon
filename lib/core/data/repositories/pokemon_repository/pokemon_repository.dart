import 'package:flutter_pokemon/core/data/mapper/pokemon_response_mapper.dart';
import 'package:flutter_pokemon/core/error/failures.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_response_entity.dart';
import 'package:fpdart/fpdart.dart';
import '../../../model/pokemon/pokemon_response_dto.dart';
import '../../data_sources/pokemon_data_source/pokemon_remote_data_source.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonSimpleResponseEntity>> getPokemonList({
    int? limit,
    int? offset,
  });
  Future<PokemonResponseDTO> getPokemonDetail(String name);
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonSimpleResponseMapper pokemonResponseMapper;
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.pokemonResponseMapper,
  });

  @override
  Future<Either<Failure, PokemonSimpleResponseEntity>> getPokemonList({
    int? limit,
    int? offset,
  }) async {
    var pokemonResponseDTO = await remoteDataSource.getPokemonList(
      limit: limit,
      offset: offset,
    );
    return Right(pokemonResponseMapper.fromDTO(pokemonResponseDTO));
  }

  @override
  Future<PokemonResponseDTO> getPokemonDetail(String name) async {
    final response = await remoteDataSource.getPokemonDetail(name);
    return response;
  }
}
