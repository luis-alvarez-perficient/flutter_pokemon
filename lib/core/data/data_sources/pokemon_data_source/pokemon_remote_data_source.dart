import 'package:flutter_pokemon/core/model/pokemon/pokemon_response_dto.dart';
import 'package:flutter_pokemon/core/network/custom_network.dart';
import '../../../model/pokemon/pokemon_simple_response_dto.dart';
import '../../../util/constant/api.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonSimpleResponseDTO> getPokemonList({int? limit, int? offset});
  Future<PokemonResponseDTO> getPokemonDetail(String name);

  // Future<dynamic> getPokemonSpecies(String name);
  // Future<dynamic> getPokemonEvolutionChain(String url);
  // Future<dynamic> getAbility(String name);
  // Future<dynamic> getType(String name);
  // Future<dynamic> getNature(String name);
  // Future<dynamic> getMove(String name);
  // Future<dynamic> getStat(String name);
  // Future<dynamic> getItem(String name);
  // Future<dynamic> getLocationArea(String name);
  // Future<dynamic> getRegion(String name);
  // Future<dynamic> getShape(String name);
  // Future<dynamic> getColor(String name);
  // Future<dynamic> getHabitat(String name);
  // Future<dynamic> getTypeEffectiveness(String name);
  // Future<dynamic> getTypeRelations(String name);
  // Future<dynamic> getTypeDamageRelations(String name);
  // Future<dynamic> getTypeWeakness(String name);
  // Future<dynamic> getTypeImmunities(String name);
  // Future<dynamic> getTypeResistances(String name);
  // Future<dynamic> getTypeVulnerabilities(String name);
  // Future<dynamic> getTypeStrengths(String name);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final CustomNetwork client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonSimpleResponseDTO> getPokemonList({
    int? limit,
    int? offset,
  }) async {
    final response = await client.get(
      Api.endpointPokemon,
      queryParameters: {'limit': limit ?? 20, 'offset': offset ?? 0},
    );
    return PokemonSimpleResponseDTO.fromMap(response);
  }

  @override
  Future<PokemonResponseDTO> getPokemonDetail(String name) async {
    final response = await client.get('${Api.endpointPokemon}$name');
    return PokemonResponseDTO.fromMap(response);
  }
}
