import 'dart:convert';

import 'package:flutter_pokemon/core/model/pokemon/stat_dto.dart';

class StatResponseDTO {
  final int baseStat;
  final int effort;
  final StatDTO stat;
  StatResponseDTO({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  StatResponseDTO copyWith({int? baseStat, int? effort, StatDTO? stat}) {
    return StatResponseDTO(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base_stat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory StatResponseDTO.fromMap(Map<String, dynamic> map) {
    return StatResponseDTO(
      baseStat: map['base_stat'],
      effort: map['effort'],
      stat: StatDTO.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatResponseDTO.fromJson(String source) =>
      StatResponseDTO.fromMap(json.decode(source));

  @override
  String toString() =>
      'StatDTO(baseStat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(covariant StatResponseDTO other) {
    if (identical(this, other)) return true;

    return other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
