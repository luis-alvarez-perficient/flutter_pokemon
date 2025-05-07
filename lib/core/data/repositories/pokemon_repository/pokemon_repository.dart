import 'package:flutter_pokemon/core/model/pokemon/pokemon_simple_response_dto.dart';
import '../../../model/pokemon/pokemon_response_dto.dart';
import '../../data_sources/pokemon_data_source/pokemon_remote_data_source.dart';

abstract class PokemonRepository {
  Future<PokemonSimpleResponseDTO> getPokemonList({int? limit, int? offset});
  Future<PokemonResponseDTO> getPokemonDetail(String name);
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PokemonSimpleResponseDTO> getPokemonList({
    int? limit,
    int? offset,
  }) async {
    var pokemonResponseDTO = await remoteDataSource.getPokemonList(
      limit: limit,
      offset: offset,
    );

    // pokemonResponseDTO.results.forEach(
    //   (pokemon) => pokemon.copyWith(
    //     image: "${Api.baseUrlPokemonImage + pokemon.name}.jpg",
    //   ),
    // );

    //   RegExp regex = RegExp(r"\b[0-9]+");
    // for (var pokemon in pokemonResponseDTO.results) {
    //   pokemon.copyWith(url: pokemon.url.replaceAll(Api.endpointPokemon, ""));
    //   // final id = regex.allMatches(pokemon.url).map((m) => m.group(0));
    //   // pokemon.copyWith(image: "${Api.baseUrlPokemonImage + pokemon.name}.jpg");
    // }
    return pokemonResponseDTO;
  }

  @override
  Future<PokemonResponseDTO> getPokemonDetail(String name) async {
    final response = await remoteDataSource.getPokemonDetail(name);
    return response;
  }
}
