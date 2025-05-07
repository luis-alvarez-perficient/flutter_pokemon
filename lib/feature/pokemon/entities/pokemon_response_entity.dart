import 'package:flutter/foundation.dart';
import 'package:flutter_pokemon/feature/pokemon/entities/pokemon_simple_entity.dart';

class PokemonEntity {
  final int count;
  final String next;
  final List<PokemonSimpleEntity> results;
  PokemonEntity({
    required this.count,
    required this.next,
    required this.results,
  });

  PokemonEntity copyWith({
    int? count,
    String? next,
    List<PokemonSimpleEntity>? results,
  }) {
    return PokemonEntity(
      count: count ?? this.count,
      next: next ?? this.next,
      results: results ?? this.results,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'count': count,
  //     'next': next,
  //     'results': results.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory PokemonEntity.fromMap(Map<String, dynamic> map) {
  //   return PokemonEntity(
  //     count: map['count'] as int,
  //     next: map['next'] as String,
  //     results: List<PokemonSimpleEntity>.from(
  //       (map['results'] as List<String>).map<PokemonSimpleEntity>(
  //         (x) => PokemonSimpleEntity.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory PokemonEntity.fromJson(String source) =>
  //     PokemonEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PokemonEntity(count: $count, next: $next, results: $results)';

  @override
  bool operator ==(covariant PokemonEntity other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => count.hashCode ^ next.hashCode ^ results.hashCode;
}
