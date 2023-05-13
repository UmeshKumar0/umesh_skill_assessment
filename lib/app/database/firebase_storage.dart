import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class MyFirebaseStorage {
  // Instance of 'FirebaseDatabase'
  final FirebaseDatabase database = FirebaseDatabase.instance;
  // Instance of 'FirebaseStorage'
  final FirebaseStorage _firebaseStorage =
      FirebaseStorage.instanceFor(bucket: 'gs://idream-project.appspot.com');

  //Function to get the image list
  Future<List<String>> listAll() async {
    List<String> imageUrls = [];
    ListResult result = await _firebaseStorage.ref().listAll();

    for (Reference ref in result.items) {
      String downloadUrl = await ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }

    return imageUrls;
  }

  //Function to get the data from firebase
  getData() async {
    try {
      final ref = database.ref();
      final snapShot = await ref.get();

      if (snapShot.value != null) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(snapShot.value as Map);
        return snapshotValue;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
