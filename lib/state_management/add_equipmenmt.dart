import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/models/addingToFirebase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEquipmentProvider extends ChangeNotifier {
   List<String> selectedChoices = [];
  final CollectionReference equipment_adding =
      FirebaseFirestore.instance.collection('Equipment Adding');
        String ?imagePath;
  void adding() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;

      uploadImage(File(pickedFile.path));
    }
    
    notifyListeners(); 
  }

  void addProduct(priceController, productNameController, quantityController,
      selectedValueNotifier, descriptionController) {
    final data = {
      'Price': priceController.text,
      'Product Name': productNameController.text,
      'Quantity': quantityController.text,
      'Size':  selectedChoices,
      'Image': imgUrl,
      'Description': descriptionController.text
    };
    equipment_adding.add(data);
    selectedChoices.clear();
    imgUrl.clear();
    imagePath=null;

    
  
  }
}
