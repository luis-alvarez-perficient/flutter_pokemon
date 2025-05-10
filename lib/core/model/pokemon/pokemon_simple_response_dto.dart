// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_pokemon/core/model/pokemon/pokemon_simple_dto.dart';

class PokemonSimpleResponseDTO {
  final int count;
  final String previous;
  final String next;
  final List<PokemonSimpleDTO> results;
  PokemonSimpleResponseDTO({
    required this.count,
    required this.previous,
    required this.next,
    required this.results,
  });

  PokemonSimpleResponseDTO copyWith({
    int? count,
    String? previous,
    String? next,
    List<PokemonSimpleDTO>? results,
  }) {
    return PokemonSimpleResponseDTO(
      count: count ?? this.count,
      previous: previous ?? this.previous,
      next: next ?? this.next,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'previous': previous,
      'next': next,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonSimpleResponseDTO.fromMap(Map<String, dynamic> map) {
    return PokemonSimpleResponseDTO(
      count: map['count'] ?? 0,
      previous: map['previous'] ?? '',
      next: map['next'] ?? '',
      results: List<PokemonSimpleDTO>.from(
        (map['results']).map<PokemonSimpleDTO>(
          (x) => PokemonSimpleDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSimpleResponseDTO.fromJson(String source) =>
      PokemonSimpleResponseDTO.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonSimpleResponseDTO(count: $count, previous: $previous , next: $next, results: $results)';

  @override
  bool operator ==(covariant PokemonSimpleResponseDTO other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.previous == previous &&
        other.next == next &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode =>
      count.hashCode ^ previous.hashCode ^ next.hashCode ^ results.hashCode;
}
