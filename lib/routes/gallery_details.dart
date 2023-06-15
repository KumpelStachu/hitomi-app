import 'package:flutter/material.dart';
import 'package:hitomi/models/gallery.dart';
import 'package:hitomi/routes/gallery_images.dart';
import 'package:hitomi/utils/hitomi.dart';
import 'package:hitomi/widgets/gallery/thumbnail_image.dart';

class GalleryDetails extends StatelessWidget {
  const GalleryDetails({super.key, required this.gallery});

  final Gallery gallery;

  void openImage(BuildContext context, {int index = 0}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => GalleryImages(gallery, initialIndex: index),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final thumb = gallery.images.first;

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: '${gallery.$id}-title',
          child: Text(
            gallery.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Artists'),
              for (final artist in gallery.artists) Text(artist.name),
            ],
          ),
          const Divider(),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: thumb.width > thumb.height ? 150 : 120,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              childAspectRatio: thumb.width / thumb.height,
              children: [
                Hero(
                  tag: '${gallery.$id}-image',
                  child: ThumbnailImage(
                    getThumbnailUrl(thumb),
                    onTap: () => openImage(context),
                    compact: true,
                  ),
                ),
                for (final (i, image) in gallery.images.indexed)
                  if (image != thumb)
                    ThumbnailImage(
                      getImageUrl(image, tn: true, sm: true),
                      onTap: () => openImage(context, index: i),
                      compact: true,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
