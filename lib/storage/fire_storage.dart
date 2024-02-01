import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;

class FileStorage {
  var fStorage = FirebaseStorage.instance;

  save(
      {required File file,
      required String path,
      required String fileName}) async {
    try {
      if (kIsWeb) {
        await fStorage
            .ref()
            .child(path)
            .child(fileName)
            .putData(file.readAsBytesSync());
      } else {
        await fStorage.ref().child(path).child(fileName).putFile(file);
      }

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  get({required String path}) async {
    var downloadURL = await fStorage.ref().child(path).getDownloadURL();

    return downloadURL;
  }
}
