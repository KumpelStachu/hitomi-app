import 'dart:convert';

class Artist {
  Artist({
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

  factory Artist.fromJson(String str) => Artist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        $id: json['\$id'],
        name: json['name'],
        $createdAt: DateTime.parse(json['\$createdAt']),
        $updatedAt: DateTime.parse(json['\$updatedAt']),
        $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {'name': name};
}
