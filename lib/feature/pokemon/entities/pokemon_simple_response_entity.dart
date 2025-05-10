import 'package:flutter/foundation.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_entity.dart';

class PokemonSimpleResponseEntity {
  final int count;
  final String previous;
  final String next;
  final List<PokemonSimpleEntity> results;
  PokemonSimpleResponseEntity({
    required this.count,
    required this.previous,
    required this.next,
    required this.results,
  });

  PokemonSimpleResponseEntity copyWith({
    int? count,
    String? previous,
    String? next,
    List<PokemonSimpleEntity>? results,
  }) {
    return PokemonSimpleResponseEntity(
      count: count ?? this.count,
      previous: previous ?? this.previous,
      next: next ?? this.next,
      results: results ?? this.results,
    );
  }

  @override
  String toString() =>
      'PokemonSimpleResponseEntity(count: $count, next: $next, results: $results)';

  @override
  bool operator ==(covariant PokemonSimpleResponseEntity other) {
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
