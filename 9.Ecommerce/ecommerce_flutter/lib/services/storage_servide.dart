import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

// This service will be responsible to uploading files to our cloud storage and
// retrieving their downloadable URL which we will use to display the image from the server.
class StorageService {
  StorageService({required this.uid});
  final String uid;

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadFile(String filePath) async {
    try {
      final dateTime = DateTime.now().toIso8601String();
      final ref = storage.ref("$uid/$dateTime");
      final uploadTask = await ref.putFile(File(filePath));
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print('error occured');
    }
    return "";
  }
}
