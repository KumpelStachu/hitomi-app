import 'package:hitomi/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:hitomi/models/gallery.dart';
import 'package:hitomi/services/galleries.dart';
import 'package:hitomi/widgets/gallery/gallery_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeLatest extends StatefulWidget {
  const HomeLatest({super.key});

  @override
  State<HomeLatest> createState() => _HomeLatestState();
}

class _HomeLatestState extends State<HomeLatest>
    with AutomaticKeepAliveClientMixin<HomeLatest> {
  final _pagingController =
      PagingController<String?, Gallery>(firstPageKey: null);
  final galleriesService = GaleriesService();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future _fetchPage(String? pageKey) async {
    try {
      final newItems = await galleriesService.getLatest(pageKey);
      final isLastPage = newItems.length < constants.defaultPageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = newItems.last.$id;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest galleries'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedGridView(
          pagingController: _pagingController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, item, index) => GalleryTile(item),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
