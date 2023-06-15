import 'package:flutter/material.dart';
import 'package:hitomi/widgets/gallery/gallery_image.dart';

class ThumbnailImage extends StatelessWidget {
  const ThumbnailImage(this.url, {super.key, this.compact = false, this.onTap});

  final String url;
  final bool compact;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(compact ? 6 : 12),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GalleryImage(url),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(compact ? 6 : 12),
            ),
          ),
        ],
      ),
    );
  }
}
