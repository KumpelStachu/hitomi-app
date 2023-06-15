import 'dart:convert';

enum TagType {
  artist,
  group,
  type,
  language,
  series,
  character,
  male,
  female,
  tag,
}

class Tag {
  Tag({
    required this.$id,
    required this.name,
    required this.type,
    this.$createdAt,
    this.$updatedAt,
    this.$permissions = const [],
  });

  String name;
  TagType type;

  String $id;
  DateTime? $createdAt;
  DateTime? $updatedAt;
  List<String> $permissions;

  factory Tag.fromJson(String str) => Tag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        $id: json['\$id'],
        name: json['name'],
        type: TagType.values
            .firstWhere((e) => e.toString() == 'TagType.${json['type']}'),
        $createdAt: DateTime.parse(json['\$createdAt']),
        $updatedAt: DateTime.parse(json['\$updatedAt']),
        $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'type': type.toString(),
      };
}
