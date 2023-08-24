import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:ecommerce_admin/commonWidgets/elevatedButton.dart';
import 'package:ecommerce_admin/commonWidgets/customAppbarWidget.dart';
import 'package:ecommerce_admin/commonWidgets/textField.dart';
import 'package:ecommerce_admin/commonWidgets/toast.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/screens/home/homeScreenAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../state_management/add_equipmenmt.dart';

// ignore: must_be_immutable
class AddingEquipmentsScreen extends StatefulWidget {
  AddingEquipmentsScreen({super.key});
  static ValueNotifier<String> selectedValueNotifier = ValueNotifier('');

  @override
  State<AddingEquipmentsScreen> createState() => _AddingEquipmentsScreenState();
}

class _AddingEquipmentsScreenState extends State<AddingEquipmentsScreen> {
  String selectedFile = '';
  final productNameController = TextEditingController();

  final quantityController = TextEditingController();

  final priceController = TextEditingController();

  final descriptionController = TextEditingController();

  List<String> choices = [
    'Uk 6',
    'UK 7',
    'UK 8',
    'UK 9',
    'UK 10',
    'UK 11',
  ];

  List<String> options = ['Football', 'Cricket', 'Badminton', 'Hockey'];
  int tag = 0;

  final usersMemoizer = C2ChoiceMemoizer<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBArWidget(title: "Adding Equipments", size: 110),
            kHeight100,
            Container(
              height: 550.h,
              width: 550.w,
              decoration: BoxDecoration(
                  color: greyShade, borderRadius: BorderRadius.circular(30.r)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 450.h,
                      width: 400.w,
                      child: Consumer<AddEquipmentProvider>(
                          builder: (context, value, _) {
                        return ClipRRect(
                          child: value.imagePath == null
                              ?
                              // Image.asset(
                              //     "asset/default/DefaultImages.png")
                              IconButton(
                                  onPressed: () {
                                    Provider.of<AddEquipmentProvider>(context,
                                            listen: false)
                                        .adding();
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.grey,
                                  iconSize: 80,
                                )
                              : Image.file(File(value.imagePath!)),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 200.h,
            ),
            TextFieldWidget(
                controller: productNameController,
                hlength: 150,
                title: "Product Name",
                wlength: 0,
                hintText: "Product Name"),
            SizedBox(
              height: 50.h,
            ),

            SizedBox(
              width: double.infinity,
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ChipsChoice<String>.multiple(
                    value: Provider.of<AddEquipmentProvider>(context,
                            listen: false)
                        .selectedChoices,
                    onChanged: (val) {
                      setState(() {
                        Provider.of<AddEquipmentProvider>(context,
                                listen: false)
                            .selectedChoices = val;
                      });
                      // print( Provider.of<AddEquipmentProvider>(context,
                      //           listen: false).selectedChoices);
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
            SizedBox(
              // width:double.infinity,
              height: 200.h,

              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ChipsChoice<int>.single(
                    value: tag,
                    onChanged: (val) => setState(() {
                      tag = val;

                      // log(val);
                    }),
                    choiceItems: C2Choice.listFrom<int, String>(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v,
                      tooltip: (i, v) => v,
                    ),
                    choiceCheckmark: true,
                    choiceStyle: C2ChipStyle.filled(
                      color: darkShades,
                      selectedStyle: const C2ChipStyle(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                // SizedBox(
                //     height: 200.h,
                //     width: MediaQuery.of(context).size.width / 2,
                //     child: CustomDropDownListEquipments(
                //       selectedValue: selectedValueNotifier.value.isEmpty
                //           ? null
                //           : selectedValueNotifier.value,
                //     )),
                TextFieldWidget(
                    keyboardType: true,
                    controller: quantityController,
                    hlength: 150,
                    title: "Quantity",
                    wlength: 2.5,
                    hintText: "Quantity"),
                TextFieldWidget(
                    keyboardType: true,
                    title: "Price",
                    wlength: 2.5,
                    hintText: "Price",
                    hlength: 150,
                    controller: priceController),
              ],
            ),
            // SizedBox(
            //   height: 50.h,
            // ),

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
               
                Provider.of<AddEquipmentProvider>(context, listen: false)
                    .addProduct(
                        priceController,
                        productNameController,
                        quantityController,
                        AddingEquipmentsScreen.selectedValueNotifier,
                        descriptionController);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreenAddProduct(),
                ));
                 AnimatedSnackBar.rectangle(
                    "Success", "The product ${productNameController.text} is successfully added",
                    type: AnimatedSnackBarType.success).show(context);
              },
            ),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }
}
