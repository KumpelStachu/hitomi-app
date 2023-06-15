import 'package:appwrite/appwrite.dart';
import 'package:hitomi/models/gallery.dart';
import 'package:hitomi/services/appwrite.dart';
import 'package:hitomi/constants.dart' as constants;

class GaleriesService {
  final Databases _databases = Databases(Appwrite.instance.client);

  Future<List<Gallery>> getLatest(String? cursor) async {
    final documentList = await _databases.listDocuments(
      databaseId: constants.databaseId,
      collectionId: constants.galleriesCollectionId,
      queries: [
        if (cursor != null) Query.cursorAfter(cursor),
        Query.limit(constants.defaultPageSize),
      ],
    );

    return documentList.documents.map((e) => Gallery.fromMap(e.data)).toList();
  }
}
