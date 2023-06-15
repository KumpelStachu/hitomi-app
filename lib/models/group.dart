import 'dart:convert';

class Group {
  Group({
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

  factory Group.fromJson(String str) => Group.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Group.fromMap(Map<String, dynamic> json) => Group(
        $id: json['\$id'],
        name: json['name'],
        $createdAt: DateTime.parse(json['\$createdAt']),
        $updatedAt: DateTime.parse(json['\$updatedAt']),
        $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {'name': name};
}
