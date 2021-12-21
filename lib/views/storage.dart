import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  static Future<String> download(String path){
    return FirebaseStorage.instance.ref(path).getDownloadURL();
  }
}
