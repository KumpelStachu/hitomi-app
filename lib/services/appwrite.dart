import 'package:hitomi/constants.dart' as constants;
import 'package:appwrite/appwrite.dart';

class Appwrite {
  static final Appwrite instance = Appwrite._internal();

  late final Client client;

  Appwrite._internal() {
    client = Client()
        .setEndpoint(constants.endpoint)
        .setProject(constants.projectId);
  }

  factory Appwrite() {
    return instance;
  }
}
