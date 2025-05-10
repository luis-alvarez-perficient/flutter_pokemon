import 'package:flutter_pokemon/common/mapper/mapper.dart';
import 'package:flutter_pokemon/core/data/mapper/pokemon_simple_mapper.dart';
import 'package:flutter_pokemon/core/model/pokemon/pokemon_simple_response_dto.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_response_entity.dart';

class PokemonSimpleResponseMapper
    extends Mapper<PokemonSimpleResponseDTO, PokemonSimpleResponseEntity> {
  final PokemonSimpleMapper pokemonSimpleMapper;
  PokemonSimpleResponseMapper({required this.pokemonSimpleMapper});

  @override
  PokemonSimpleResponseEntity fromDTO(PokemonSimpleResponseDTO dto) {
    return PokemonSimpleResponseEntity(
      count: dto.count,
      previous: dto.previous,
      next: dto.next,
      results: pokemonSimpleMapper.fromDTOList(dto.results),
    );
  }

  @override
  PokemonSimpleResponseDTO toDTO(PokemonSimpleResponseEntity entity) {
    return PokemonSimpleResponseDTO(
      count: entity.count,
      previous: entity.previous,
      next: entity.next,
      results: pokemonSimpleMapper.toDTOList(entity.results),
    );
  }
}
