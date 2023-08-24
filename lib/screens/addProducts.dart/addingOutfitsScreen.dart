import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:ecommerce_admin/commonWidgets/elevatedButton.dart';
import 'package:ecommerce_admin/commonWidgets/customAppbarWidget.dart';
import 'package:ecommerce_admin/commonWidgets/textField.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/screens/home/homeScreenAdd.dart';
import 'package:ecommerce_admin/state_management/add_outfits.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class AddingOutfitsScreen extends StatefulWidget {
  AddingOutfitsScreen({super.key});
  static ValueNotifier<String> selectedValueNotifier = ValueNotifier('');

  @override
  State<AddingOutfitsScreen> createState() => _AddingOutfitsScreenState();
}

class _AddingOutfitsScreenState extends State<AddingOutfitsScreen> {
  List<String> choices = [
    'Small',
    'Large',
    'XL',
    'XXL',
    'XXXL',
  ];
final TextEditingController productNameController = TextEditingController();

final TextEditingController quantityController = TextEditingController();

final TextEditingController priceController = TextEditingController();

final TextEditingController descriptionController = TextEditingController();

 

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBArWidget(title: "Adding Outfits", size: 140),
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
                          child: Consumer<AddingOutfitsPovider>(
                            builder: (context, value, _) {
                              return ClipRRect(
                                child: value.imagePath == null
                                    ? Image.asset(
                                        "asset/default/DefaultImages.png")
                                    : Image.file(File(value.imagePath!)),
                              );
                            },
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
                        Provider.of<AddingOutfitsPovider>(context,
                                listen: false)
                            .addOutfitsImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 200.h,
            ),
            TextFieldWidget(
              controller: productNameController,
              hlength: 150,
              title: "Product Name",
              wlength: 0,
              hintText: "Product Name",
            ),
             SizedBox(
              width: double.infinity,
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ChipsChoice<String>.multiple(
                    value:Provider.of<AddingOutfitsPovider>(context,listen: false).selectChoice,
                    onChanged: (val) {
                      setState(() {
                        Provider.of<AddingOutfitsPovider>(context,listen: false).selectChoice = val;
                        
                      });
                      // print(selectedChoices);
                    },
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: choices,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceStyle: C2ChipStyle.outlined(
                      borderWidth: 2,
                      selectedStyle:  C2ChipStyle(
                        borderColor: darkShades,
                        foregroundColor: darkShades,
                      ),
                    ),
                  )
                ],
              ),
            ),
            kHeight80,
            Row(
              children: [
               
                TextFieldWidget(
                    keyboardType: true,
                    title: "Price",
                    wlength: 2.5,
                    hintText: "Price",
                    hlength: 150,
                    controller: priceController),
                TextFieldWidget(
                    keyboardType: true,
                    controller: quantityController,
                    hlength: 150,
                    title: "Quantity",
                    wlength: 2.5,
                    hintText: "Quantity"),
              ],
            ),
            kHeight80,
            SizedBox(
              height: 50.h,
            ),
            TextFieldWidget(
                title: "Description",
                wlength: 0,
                hintText: "Description",
                hlength: 400,
                controller: descriptionController),
            SizedBox(
              height: 100.h,
            ),
            ElevatedButtonWidget(
              title: "Add Product",
              action: () {
                Provider.of<AddingOutfitsPovider>(context, listen: false)
                    .addProduct(
                        priceController,
                        productNameController,
                        quantityController,
                        AddingOutfitsScreen.selectedValueNotifier,
                        descriptionController);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeScreenAddProduct(),
                  ),
                );
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
