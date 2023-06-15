import 'dart:convert';

import 'package:hitomi/models/artist.dart';
import 'package:hitomi/models/character.dart';
import 'package:hitomi/models/group.dart';
import 'package:hitomi/models/image.dart';
import 'package:hitomi/models/series.dart';
import 'package:hitomi/models/tag.dart';

enum GalleryType {
  doujinshi,
  manga,
  artistcg,
  gamecg,
  anime,
}

class Gallery {
  Gallery({
    required this.$id,
    required this.id,
    required this.type,
    required this.languageName,
    required this.title,
    required this.publishedDate,
    required this.relatedIds,
    required this.artists,
    required this.groups,
    required this.series,
    required this.characters,
    required this.tags,
    required this.images,
    this.$createdAt,
    this.$updatedAt,
    this.$permissions = const [],
  });

  int id;
  GalleryType type;
  String? languageName;
  String title;
  DateTime publishedDate;
  List<int> relatedIds;

  List<Artist> artists;
  List<Group> groups;
  List<Series> series;
  List<Character> characters;
  List<Tag> tags;
  List<Image> images;

  String $id;
  DateTime? $createdAt;
  DateTime? $updatedAt;
  List<String> $permissions;

  factory Gallery.fromJson(String str) => Gallery.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gallery.fromMap(Map<String, dynamic> json) {
    return Gallery(
      $id: json['\$id'],
      id: json['id'],
      type: GalleryType.values
          .firstWhere((e) => e.toString() == 'GalleryType.${json['type']}'),
      languageName: json['languageName_english'],
      title: json['title_display'],
      publishedDate: DateTime.parse(json['publishedDate']),
      relatedIds: List<int>.from(json['relatedIds'].map((x) => x)),
      artists: List<Artist>.from(json['artists'].map((x) => Artist.fromMap(x))),
      groups: List<Group>.from(json['groups'].map((x) => Group.fromMap(x))),
      series: List<Series>.from(json['series'].map((x) => Series.fromMap(x))),
      characters: List<Character>.from(
          json['characters'].map((x) => Character.fromMap(x))),
      tags: List<Tag>.from(json['tags'].map((x) => Tag.fromMap(x))),
      images: List<Image>.from(json['images'].map((x) => Image.fromMap(x)))
        ..sort((a, b) => a.index - b.index),
      $createdAt: DateTime.parse(json['\$createdAt']),
      $updatedAt: DateTime.parse(json['\$updatedAt']),
      $permissions: List<String>.from(json['\$permissions'].map((x) => x)),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type.toString(),
        'languageName_english': languageName,
        'title_display': title,
        'publishedDate': publishedDate.toIso8601String(),
        'relatedIds': relatedIds,
        'artists': List<dynamic>.from(artists.map((x) => x.toMap())),
        'groups': List<dynamic>.from(groups.map((x) => x.toMap())),
        'series': List<dynamic>.from(series.map((x) => x.toMap())),
        'characters': List<dynamic>.from(characters.map((x) => x.toMap())),
        'tags': List<dynamic>.from(tags.map((x) => x.toMap())),
        'images': List<dynamic>.from(images.map((x) => x.toMap())),
      };
}
