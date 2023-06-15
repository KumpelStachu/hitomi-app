import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hitomi/models/gallery.dart';
import 'package:hitomi/providers/settings.dart';
import 'package:hitomi/utils/hitomi.dart';
import 'package:hitomi/widgets/gallery/gallery_image.dart';

class GalleryImages extends StatefulWidget {
  const GalleryImages(this.gallery, {super.key, this.initialIndex = 0});

  final Gallery gallery;
  final int initialIndex;

  @override
  State<GalleryImages> createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  _preloadImages() {
    final settings = Settings.of(context, listen: false);
    final offset = settings.preloadOffset;

    final from = max(_currentPage - offset, 0);
    final to = min(_currentPage + offset, widget.gallery.images.length - 1);

    for (var i = from; i <= to; i++) {
      if (i == _currentPage) continue;
      precacheImage(
        CachedNetworkImageProvider(getImageUrl(widget.gallery.images[i])),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = Settings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page ${_currentPage + 1}/${widget.gallery.images.length}'),
      ),
      body: PageView.builder(
        controller: _pageController,
        reverse: settings.reverseScroll,
        onPageChanged: (page) {
          setState(() => _currentPage = page);
          _preloadImages();
        },
        itemCount: widget.gallery.images.length,
        itemBuilder: (context, index) {
          return GalleryImage(
            getImageUrl(widget.gallery.images[index]),
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}
