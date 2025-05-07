import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_pokemon/core/model/pokemon/stat_response_dto.dart';
import 'package:flutter_pokemon/core/model/pokemon/type_response_dto.dart';

class PokemonResponseDTO {
  // final List<Abilitie> abilities;
  final int baseExperience;
  // final Cries cries;
  // final List<Form> forms;
  // final List<Game_indice> game_indices;
  final int height;
  // final List<dynamic> held_items;
  // final int id;
  // final bool is_default;
  // final String location_area_encounters;
  // final List<Move> moves;
  final String name;
  // final int order;
  // final List<Past_abilitie> past_abilities;
  // final List<dynamic> past_types;
  // final Species species;
  // final Sprites sprites;
  final List<StatResponseDTO> stats;
  final List<TypeResponseDTO> types;
  final int weight;
  PokemonResponseDTO({
    // required this.abilities,
    required this.baseExperience,
    // required this.cries,
    // required this.forms,
    // required this.game_indices,
    required this.height,
    // required this.held_items,
    // required this.id,
    // required this.is_default,
    // required this.location_area_encounters,
    // required this.moves,
    required this.name,
    // required this.order,
    // required this.past_abilities,
    // required this.past_types,
    // required this.species,
    // required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  PokemonResponseDTO copyWith({
    // List<Abilitie>? abilities,
    int? baseExperience,
    // Cries? cries,
    // List<Form>? forms,
    // List<Game_indice>? game_indices,
    int? height,
    // List<dynamic>? held_items,
    int? id,
    // bool? is_default,
    // String? location_area_encounters,
    // List<Move>? moves,
    String? name,
    int? order,
    // List<Past_abilitie>? past_abilities,
    // List<dynamic>? past_types,
    // Species? species,
    // Sprites? sprites,
    List<StatResponseDTO>? stats,
    List<TypeResponseDTO>? types,
    int? weight,
  }) {
    return PokemonResponseDTO(
      // abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      // cries: cries ?? this.cries,
      // forms: forms ?? this.forms,
      // game_indices: game_indices ?? this.game_indices,
      height: height ?? this.height,
      // held_items: held_items ?? this.held_items,
      // id: id ?? this.id,
      // is_default: is_default ?? this.is_default,
      // location_area_encounters: location_area_encounters ?? this.location_area_encounters,
      // moves: moves ?? this.moves,
      name: name ?? this.name,
      // order: order ?? this.order,
      // past_abilities: past_abilities ?? this.past_abilities,
      // past_types: past_types ?? this.past_types,
      // species: species ?? this.species,
      // sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'abilities': abilities.map((x) => x.toMap()).toList(),
      'base_experience': baseExperience,
      // 'cries': cries.toMap(),
      // 'forms': forms.map((x) => x.toMap()).toList(),
      // 'game_indices': game_indices.map((x) => x.toMap()).toList(),
      'height': height,
      // 'held_items': held_items,
      // 'id': id,
      // 'is_default': is_default,
      // 'location_area_encounters': location_area_encounters,
      // 'moves': moves.map((x) => x.toMap()).toList(),
      'name': name,
      // 'order': order,
      // 'past_abilities': past_abilities.map((x) => x.toMap()).toList(),
      // 'past_types': past_types,
      // 'species': species.toMap(),
      // 'sprites': sprites.toMap(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
      'weight': weight,
    };
  }

  factory PokemonResponseDTO.fromMap(Map<String, dynamic> map) {
    return PokemonResponseDTO(
      // abilities: List<Abilitie>.from((map['abilities'] as List<int>).map<Abilitie>((x) => Abilitie.fromMap(x as Map<String,dynamic>),),),
      baseExperience: map['base_experience'],
      // cries: Cries.fromMap(map['cries'] as Map<String,dynamic>),
      // forms: List<Form>.from((map['forms'] as List<int>).map<Form>((x) => Form.fromMap(x as Map<String,dynamic>),),),
      // game_indices: List<Game_indice>.from((map['game_indices'] as List<int>).map<Game_indice>((x) => Game_indice.fromMap(x as Map<String,dynamic>),),),
      height: map['height'],
      // held_items: List<dynamic>.from((map['held_items'] as List<dynamic>),
      // id: map['id'].toInt() as int,
      // is_default: map['is_default'] as bool,
      // location_area_encounters: map['location_area_encounters'] as String,
      // moves: List<Move>.from((map['moves'] as List<int>).map<Move>((x) => Move.fromMap(x as Map<String,dynamic>),),),
      name: map['name'],
      // order: map['order'].toInt() as int,
      // past_abilities: List<Past_abilitie>.from((map['past_abilities'] as List<int>).map<Past_abilitie>((x) => Past_abilitie.fromMap(x as Map<String,dynamic>),),),
      // past_types: List<dynamic>.from((map['past_types'] as List<dynamic>),
      // species: Species.fromMap(map['species'] as Map<String,dynamic>),
      // sprites: Sprites.fromMap(map['sprites'] as Map<String,dynamic>),
      stats: List<StatResponseDTO>.from(
        (map['stats']).map<StatResponseDTO>(
          (x) => StatResponseDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
      types: List<TypeResponseDTO>.from(
        (map['types']).map<TypeResponseDTO>(
          (x) => TypeResponseDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResponseDTO.fromJson(String source) =>
      PokemonResponseDTO.fromMap(json.decode(source));

  // @override
  // String toString() {
  //   return 'PokemonResponseDTO(abilities: $abilities, baseExperience: $baseExperience, cries: $cries, forms: $forms, game_indices: $game_indices, height: $height, held_items: $held_items, id: $id, is_default: $is_default, location_area_encounters: $location_area_encounters, moves: $moves, name: $name, order: $order, past_abilities: $past_abilities, past_types: $past_types, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  // }

  @override
  bool operator ==(covariant PokemonResponseDTO other) {
    if (identical(this, other)) return true;

    return
    // listEquals(other.abilities, abilities) &&
    other.baseExperience == baseExperience &&
        // other.cries == cries &&
        // listEquals(other.forms, forms) &&
        // listEquals(other.game_indices, game_indices) &&
        other.height == height &&
        // listEquals(other.held_items, held_items) &&
        // other.id == id &&
        // other.is_default == is_default &&
        // other.location_area_encounters == location_area_encounters &&
        // listEquals(other.moves, moves) &&
        other.name == name &&
        // other.order == order &&
        // listEquals(other.past_abilities, past_abilities) &&
        // listEquals(other.past_types, past_types) &&
        // other.species == species &&
        // other.sprites == sprites &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types) &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    // return abilities.hashCode ^
    return baseExperience.hashCode ^
        // cries.hashCode ^
        // forms.hashCode ^
        // game_indices.hashCode ^
        height.hashCode ^
        // held_items.hashCode ^
        // id.hashCode ^
        // is_default.hashCode ^
        // location_area_encounters.hashCode ^
        // moves.hashCode ^
        name.hashCode ^
        // order.hashCode ^
        // past_abilities.hashCode ^
        // past_types.hashCode ^
        // species.hashCode ^
        // sprites.hashCode ^
        stats.hashCode ^
        types.hashCode ^
        weight.hashCode;
  }
}
