import 'dart:convert';

import 'package:get/get.dart';
import 'package:i_dream_assessment/app/database/firebase_storage.dart';

class HomeController extends GetxController {
  //Boolean value to change the language 
  RxBool language = false.obs;
 // Instance of 'MyFirebaseStorage' 
  MyFirebaseStorage myFirebaseStorage = MyFirebaseStorage();

  //List of image urls
  RxList<String> imageUrls = <String>[].obs;

  //List of projects, books and subjects
  RxList<List<String>> projects = <List<String>>[].obs;
  RxList<List<String>> books = <List<String>>[].obs;
  RxList<List<String>> subjects = <List<String>>[].obs;
  //Selected class
  RxInt selectedClass = 9.obs;
  // data from firebase
  Map<String, dynamic> data = {};
  @override
  void onInit() async {
    //Get the image list
    await getImageList();
   //Get the data from firebase
    await getData();
    super.onInit();
  }

  //Function to get the image list
  getImageList() {
    myFirebaseStorage.listAll().then((value) {
      imageUrls.addAll(value);
    });
  }

  //Function to get the data from firebase
  getData() async {
    data = await myFirebaseStorage.getData();

    data['Projects'].forEach((value) {
      projects.add(List<String>.from(value));
    });
    data['Books'].forEach((value) {
      books.add(List<String>.from(value));
    });
    data['Subjects'].forEach((value) {
      subjects.add(List<String>.from(value));
    });
  }
}
