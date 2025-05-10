import 'package:flutter_pokemon/common/mapper/mapper.dart';
import 'package:flutter_pokemon/core/model/pokemon/pokemon_simple_dto.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_entity.dart';

class PokemonSimpleMapper
    implements Mapper<PokemonSimpleDTO, PokemonSimpleEntity> {
  @override
  PokemonSimpleEntity fromDTO(PokemonSimpleDTO dto) {
    return PokemonSimpleEntity(
      id: dto.id,
      name: dto.name,
      url: dto.url,
      image: dto.image,
    );
  }

  @override
  PokemonSimpleDTO toDTO(PokemonSimpleEntity entity) {
    return PokemonSimpleDTO(
      id: entity.id,
      name: entity.name,
      url: entity.url,
      image: entity.image,
    );
  }

  @override
  List<PokemonSimpleEntity> fromDTOList(List<PokemonSimpleDTO> dtos) {
    return dtos.map((dto) => fromDTO(dto)).toList();
  }

  @override
  List<PokemonSimpleDTO> toDTOList(List<PokemonSimpleEntity> entities) {
    return entities.map((entity) => toDTO(entity)).toList();
  }
}
