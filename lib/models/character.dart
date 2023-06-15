import 'dart:convert';

class Character {
  Character({
    required this.$id,
    required this.name,
    this.$createdAt,
    this.$updatedAt,
    this.$permissions = const [],
  });

  String name;

  String $id;
  DateTime? $createdAt;
  DateTime? $updatedAt;
  List<String> $permissions;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        $id: json['\$id'],
        name: json['name'],
        $createdAt: DateTime.parse(json['\$createdAt']),
        $updatedAt: DateTime.parse(json['\$updatedAt']),
        $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {'name': name};
}
