
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final List imgUrl = [];
//  String updateImage='';
  List updateImage = [];



Future<String> uploadImage(File imageFile) async {
  final uniqueImgName = DateTime.now();
  final refRoot = FirebaseStorage.instance.ref();
  final storageRef = refRoot.child('images');

  final imgToUpload = storageRef.child(uniqueImgName.toString());

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  // print('Image uploaded at $downloadURL');
  imgUrl.add(downloadURL);
  log(downloadURL);
  return downloadURL;
}


Future<String> uploadUpdateImage(File imageFile) async {
  final uniqueImgName = DateTime.now();
  final refRoot = FirebaseStorage.instance.ref();
  final storageRef = refRoot.child('images');

  final imgToUpload = storageRef.child(uniqueImgName.toString());

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  // print('Image uploaded at $downloadURL');
  updateImage.add(downloadURL);
  log(downloadURL);
  return downloadURL;
}

