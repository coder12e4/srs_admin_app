import 'dart:developer';
import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/commonWidgets/customAppbarWidget.dart';
import 'package:ecommerce_admin/commonWidgets/elevatedButton.dart';
import 'package:ecommerce_admin/commonWidgets/textField.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/getx_manager/api_getx.dart';
import 'package:ecommerce_admin/models/addingToFirebase.dart';
import 'package:ecommerce_admin/models/allproducts_data_model.dart';
import 'package:ecommerce_admin/screens/home/homeScreenAdd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UpdateEquipmentScreen extends StatefulWidget {
  UpdateEquipmentScreen({super.key, required this.snap});
  ProductsDetails snap;
  @override
  State<UpdateEquipmentScreen> createState() => _UpdateEquipmentScreenState();
}

final ApiServices _apiServices = Get.find();
String? imagePath;
List imagePathList = [];

class _UpdateEquipmentScreenState extends State<UpdateEquipmentScreen> {
  List<String> selectedChoices = [];

  late final productNameController =
      TextEditingController(text: widget.snap.name);
  late final quantityController =
      TextEditingController(text: widget.snap.company);
  late final priceController =
      TextEditingController(text: widget.snap.price.toString());
  late final descriptionController =
      TextEditingController(text: widget.snap.description);
  List<String> choices = [
    'Uk 6',
    'UK 7',
    'UK 8',
    'UK 9',
    'UK 10',
    'UK 11',
  ];
  bool isUpdate = false;
  final CollectionReference equipment =
      FirebaseFirestore.instance.collection('Equipment Adding');

  void updateProduct(docid) {
    final data = {
      'Price': priceController.text,
      'Product Name': productNameController.text,
      'Quantity': quantityController.text,
      'Size': selectedChoices,
      'Image': updateImage,
      'Description': descriptionController.text
    };
    equipment.doc(docid).set(data);
  }

  void updatingImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;

      uploadUpdateImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    // imagePathList = widget.snap.image;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBArWidget(title: "Edit Product", size: 188),
            kHeight100,
            Stack(
              children: [
                Container(
                  height: 550.h,
                  width: 550.w,
                  decoration: BoxDecoration(
                      color: greyShade,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: 450.h,
                          width: 400.w,
                          child: ClipRRect(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    log(index.toString());

                                    return Image.network(widget.snap.image);
                                  })
                              //  imagePathList == null
                              //     ? Image.asset("asset/default/DefaultImages.png"):

                              //  Image.file(File(imagePathList[0]!)),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  left: 140,
                  child: IconButton(
                      onPressed: () {
                        updatingImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                      )),
                )
              ],
            ),
            kHeight80,
            TextFieldWidget(
                controller: productNameController,
                hlength: 150,
                title: "Product Name",
                wlength: 0,
                hintText: "Product Name"),
            kFormField30,
            SizedBox(
              width: double.infinity,
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ChipsChoice<String>.multiple(
                    value: selectedChoices,
                    onChanged: (val) {
                      setState(() {
                        selectedChoices = val;
                        // print(selectedChoices);
                      });
                    },
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: choices,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceStyle: C2ChipStyle.outlined(
                      borderWidth: 2,
                      selectedStyle: C2ChipStyle(
                        borderColor: darkShades,
                        foregroundColor: darkShades,
                      ),
                    ),
                  )
                ],
              ),
            ),
            kFormField30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldWidget(
                    title: "Quantity",
                    wlength: 2.5,
                    hintText: "Quantity",
                    hlength: 150,
                    controller: quantityController),
                TextFieldWidget(
                    title: "Price",
                    wlength: 2.5,
                    hintText: "Price",
                    hlength: 150,
                    controller: priceController),
              ],
            ),
            kFormField30,
            TextFieldWidget(
                title: "Description",
                wlength: 0,
                hintText: "Description",
                hlength: 500,
                controller: descriptionController),
            SizedBox(
              height: 100.h,
            ),
            ElevatedButtonWidget(
              title: "Update Product",
              action: () {
                // if (updateImage.isEmpty) {
                //   updateImage = (widget.snap.image);
                // }
                log(widget.snap.id);
                _apiServices
                    .updateProduct(
                      widget.snap.id,
                      productNameController.text,
                      descriptionController.text,
                      'office',
                      quantityController.text,
                      priceController.text,
                    )
                    .then((value) =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreenAddProduct(),
                        )));

                // updateProduct(
                //   widget.snap.id,
                // );
              },
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
