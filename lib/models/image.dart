import 'dart:convert';

enum Extension {
  webp,
  avif,
  jpg,
  png,
  gif,
}

class Image {
  Image({
    required this.$id,
    required this.index,
    required this.hash,
    required this.extension,
    required this.hasWebp,
    required this.hasAvif,
    required this.width,
    required this.height,
    this.$createdAt,
    this.$updatedAt,
    this.$permissions = const [],
  });

  int index;
  String hash;
  Extension extension;
  bool hasWebp;
  bool hasAvif;
  int width;
  int height;

  String $id;
  DateTime? $createdAt;
  DateTime? $updatedAt;
  List<String> $permissions;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        $id: json['\$id'],
        index: json['index'],
        hash: json['hash'],
        extension: Extension.values.firstWhere(
            (e) => e.toString() == 'Extension.${json['extension']}'),
        hasWebp: json['hasWebp'],
        hasAvif: json['hasAvif'],
        width: json['width'],
        height: json['height'],
        $createdAt: DateTime.parse(json['\$createdAt']),
        $updatedAt: DateTime.parse(json['\$updatedAt']),
        $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'hash': hash,
        'extension': extension.toString(),
        'hasWebp': hasWebp,
        'hasAvif': hasAvif,
        'width': width,
        'height': height,
      };
}
