import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseApi {

  static Future downloadFile(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.getDownloadURL();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);
  }
}
