import 'package:flutter/material.dart';
import 'package:hitomi/models/gallery.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/routes/gallery_details.dart';
import 'package:hitomi/utils/hitomi.dart';
import 'package:hitomi/widgets/blur.dart';
import 'package:hitomi/widgets/gallery/gallery_image.dart';

class GalleryTile extends StatelessWidget {
  const GalleryTile(this.gallery, {super.key});

  final Gallery gallery;

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return GridTile(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Blur(
              borderRadius: BorderRadius.circular(8),
              blur: settings.blurThumbnails ? 8 : 0,
              child: Hero(
                tag: '${gallery.$id}-image',
                child: GalleryImage(getThumbnailUrl(gallery.images.first)),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GalleryDetails(gallery: gallery),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: '${gallery.$id}-title',
                        child: Text(
                          gallery.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
