import 'dart:convert';

class Series {
  Series({
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

  factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Series.fromMap(Map<String, dynamic> json) => Series(
        $id: json['\$id'],
        name: json['name'],
        $createdAt: DateTime.parse(json['\$createdAt']),
        $updatedAt: DateTime.parse(json['\$updatedAt']),
        $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {'name': name};
}
