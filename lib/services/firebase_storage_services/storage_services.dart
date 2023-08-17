import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String?> uploadFile(
    String fileName,
    String filePath,
  ) async {
    File file = File(filePath);
    try {
      await storage.ref('userpics/$fileName').putFile(file);
      String downloadURL =
          await storage.ref('userpics/$fileName').getDownloadURL();
      if (kDebugMode) {
        print(downloadURL);
      }
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
