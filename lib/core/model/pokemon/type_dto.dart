import 'dart:convert';

class TypeDTO {
  final String name;
  final String url;
  TypeDTO({required this.name, required this.url});

  TypeDTO copyWith({String? name, String? url}) {
    return TypeDTO(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory TypeDTO.fromMap(Map<String, dynamic> map) {
    return TypeDTO(name: map['name'], url: map['url']);
  }

  String toJson() => json.encode(toMap());

  factory TypeDTO.fromJson(String source) =>
      TypeDTO.fromMap(json.decode(source));

  @override
  String toString() => 'TypeDTO(name: $name, url: $url)';

  @override
  bool operator ==(covariant TypeDTO other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
