import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/models/addingToFirebase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddingOutfitsPovider extends ChangeNotifier {
  List<String> selectChoice = [];
  final CollectionReference outFits =
      FirebaseFirestore.instance.collection('Outfits');
  String? imagePath;
  void addOutfitsImage() async {
    final pickedFile2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile2 != null) {
      imagePath = pickedFile2.path;

      uploadImage(File(pickedFile2.path));
    }
  }

  void addProduct(priceController, productNameController, quantityController,
      selectedValueNotifier, descriptionController) {
    final data = {
      'Price': priceController.text,
      'Product Name': productNameController.text,
      'Quantity': quantityController.text,
      'Size':  selectChoice ,
      'Image': imgUrl,
      'Description': descriptionController.text,
    };
    outFits.add(data);
    selectChoice.clear();
    imagePath =null;
  }
}
