import 'package:hitomi/models/image.dart';
import 'package:hitomi/models/tag.dart';

String getThumbnailUrl(Image image) => getImageUrl(image, tn: true);

String getImageUrl(Image image, {tn = false, sm = false}) =>
    'https://hitomi.kums.me/image/${image.hash}.${image.hasWebp ? 'webp' : 'avif'}?${tn ? 'tn' : ''}${tn && sm ? '&' : ''}${sm ? 'sm' : ''}';

Map<TagType, List<Tag>> groupTags(List<Tag> tags) {
  return tags.fold(<TagType, List<Tag>>{
    TagType.artist: [],
    TagType.character: [],
    TagType.group: [],
    TagType.language: [],
    TagType.series: [],
    TagType.tag: [],
    TagType.type: [],
  }, (map, tag) {
    map[tag.type]!.add(tag);
    return map;
  });
}
