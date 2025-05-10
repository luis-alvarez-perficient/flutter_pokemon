// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_pokemon/core/util/constant/api.dart';

class PokemonSimpleDTO {
  final int id;
  final String name;
  final String url;
  final String image;

  PokemonSimpleDTO({
    required this.id,
    required this.name,
    required this.url,
    required this.image,
  });

  PokemonSimpleDTO copyWith({String? name, String? url, String? image}) {
    return PokemonSimpleDTO(
      id: id,
      name: name ?? this.name,
      url: url ?? this.url,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url, 'image': image};
  }

  factory PokemonSimpleDTO.fromMap(Map<String, dynamic> map) {
    final id = int.parse(
      RegExp(r"\b[0-9]+").firstMatch(map['url'])?.group(0) ?? "0",
    );

    final image = "${Api.baseUrlPokemonImage}${map['name'] ?? ''}.jpg";

    return PokemonSimpleDTO(
      id: id,
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      image: image,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSimpleDTO.fromJson(String source) =>
      PokemonSimpleDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PokemonSimpleDTO(id: $id name: $name, url: $url, image: $image)';

  @override
  bool operator ==(covariant PokemonSimpleDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.url == url &&
        other.image == image;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ url.hashCode ^ image.hashCode;
}
