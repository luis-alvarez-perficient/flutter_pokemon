// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_pokemon/core/model/pokemon/pokemon_simple_dto.dart';

class PokemonSimpleResponseDTO {
  final int count;
  final String next;
  final List<PokemonSimpleDTO> results;
  PokemonSimpleResponseDTO({
    required this.count,
    required this.next,
    required this.results,
  });

  PokemonSimpleResponseDTO copyWith({
    int? count,
    String? next,
    List<PokemonSimpleDTO>? results,
  }) {
    return PokemonSimpleResponseDTO(
      count: count ?? this.count,
      next: next ?? this.next,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonSimpleResponseDTO.fromMap(Map<String, dynamic> map) {
    return PokemonSimpleResponseDTO(
      count: map['count'] as int,
      next: map['next'] as String,
      results: List<PokemonSimpleDTO>.from(
        (map['results']).map<PokemonSimpleDTO>(
          (x) => PokemonSimpleDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSimpleResponseDTO.fromJson(String source) =>
      PokemonSimpleResponseDTO.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'PokemonSimpleResponseDTO(count: $count, next: $next, results: $results)';

  @override
  bool operator ==(covariant PokemonSimpleResponseDTO other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => count.hashCode ^ next.hashCode ^ results.hashCode;
}
