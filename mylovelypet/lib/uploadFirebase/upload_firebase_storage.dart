import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UploadFirebaseStorage{
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(String url,File file)async{
    final ref = _storage.ref(url);
    final task = await ref.putFile(file);
    final urlDownload = await task.ref.getDownloadURL();
    print('urlDownload : $urlDownload');
    return urlDownload;
  }

}