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
      // dto.results
      //     .map(
      //       (e) => PokemonSimpleEntity(
      //         id: e.id,
      //         name: e.name,
      //         url: e.url,
      //         image: e.image,
      //       ),
      //     )
      //     .toList(),
    );
  }

  @override
  PokemonSimpleResponseDTO toDTO(PokemonSimpleResponseEntity entity) {
    return PokemonSimpleResponseDTO(
      count: entity.count,
      previous: entity.previous,
      next: entity.next,
      results: pokemonSimpleMapper.toDTOList(entity.results),

      // entity.results
      //     .map(
      //       (e) => PokemonSimpleDTO(
      //         id: e.id,
      //         name: e.name,
      //         url: e.url,
      //         image: e.image,
      //       ),
      //     )
      //     .toList(),
    );
  }

  // @override
  // PokemonSimpleEntity fromDTO(PokemonSimpleDTO dto) {
  //   return PokemonSimpleEntity(
  //     id: dto.id,
  //     name: dto.name,
  //     url: dto.url,
  //     image: dto.image,
  //   );
  // }

  // @override
  // PokemonSimpleDTO toDTO(PokemonSimpleEntity entity) {
  //   return PokemonSimpleDTO(
  //     id: entity.id,
  //     name: entity.name,
  //     url: entity.url,
  //     image: entity.image,
  //   );
  // }
}
