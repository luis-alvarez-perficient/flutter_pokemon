import 'dart:convert';

import 'package:flutter_pokemon/core/model/pokemon/type_dto.dart';

class TypeResponseDTO {
  final int slot;
  final TypeDTO type;
  TypeResponseDTO({required this.slot, required this.type});

  TypeResponseDTO copyWith({int? slot, TypeDTO? type}) {
    return TypeResponseDTO(slot: slot ?? this.slot, type: type ?? this.type);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'slot': slot, 'type': type.toMap()};
  }

  factory TypeResponseDTO.fromMap(Map<String, dynamic> map) {
    return TypeResponseDTO(
      slot: map['slot'],
      type: TypeDTO.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeResponseDTO.fromJson(String source) =>
      TypeResponseDTO.fromMap(json.decode(source));

  @override
  String toString() => 'TypeResponseDTO(slot: $slot, type: $type)';

  @override
  bool operator ==(covariant TypeResponseDTO other) {
    if (identical(this, other)) return true;

    return other.slot == slot && other.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
