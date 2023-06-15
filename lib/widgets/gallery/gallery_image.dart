import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hitomi/widgets/image_error.dart';
import 'package:hitomi/widgets/image_loader.dart';

class GalleryImage extends StatelessWidget {
  const GalleryImage(this.url,
      {super.key, this.compact = false, this.fit = BoxFit.cover});

  final String url;
  final bool compact;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (context, url, error) => ImageError(compact: compact),
      progressIndicatorBuilder: (context, url, progress) =>
          ImageLoader(progress.progress, compact: compact),
      fit: fit,
    );
  }
}
