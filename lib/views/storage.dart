import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {

  static Future<String> getDownloadUrl(String path) async {
    return FirebaseStorage.instance.ref(path).getDownloadURL();
  }
  static String download(String path){
    String downloadUrl = getDownloadUrl(path) as String;
    return downloadUrl;
  }
}
