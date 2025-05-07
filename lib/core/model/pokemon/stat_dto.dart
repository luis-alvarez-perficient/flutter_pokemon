import 'dart:convert';

class StatDTO {
  final String name;
  final String url;
  StatDTO({required this.name, required this.url});

  StatDTO copyWith({String? name, String? url}) {
    return StatDTO(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory StatDTO.fromMap(Map<String, dynamic> map) {
    return StatDTO(name: map['name'], url: map['url']);
  }
  String toJson() => json.encode(toMap());
  factory StatDTO.fromJson(String source) =>
      StatDTO.fromMap(json.decode(source));
  @override
  String toString() => 'StatDTO(name: $name, url: $url)';
  @override
  bool operator ==(covariant StatDTO other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
