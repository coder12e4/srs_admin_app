// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/authentication/widget_Tree.dart';
import 'package:ecommerce_admin/commonWidgets/rflutter_dialog.dart';
import 'package:ecommerce_admin/const/api_url.dart';
import 'package:ecommerce_admin/getx_manager/api_getx.dart';
import 'package:ecommerce_admin/screens/update_products/update_products_equipment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/constants.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
  });
  final ApiServices _apiServices = Get.find();

  final CollectionReference equipment =
      FirebaseFirestore.instance.collection('Equipment Adding');

  deleteEquip(docId) {
    equipment.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiServices.getAllPublicProduct(getAllProducts),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final productList = snapshot.data;
            return ListView.builder(
              itemCount: productList!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateEquipmentScreen(snap: productList[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 70.w, bottom: 50.w, right: 70.w, top: 20.w),
                    height: 250.h,
                    width: 1000.w,
                    decoration: BoxDecoration(
                      color: greyShade,
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 200.w,
                          child: ClipRRect(
                            child: Image.network(
                              productList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 200.h,
                            width: 400.w,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.w, left: 40.w),
                              child: Text(
                                productList[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500),
                                // velocity: const Velocity(
                                //     pixelsPerSecond: Offset(30, 0)),
                                // pauseBetween:
                                //     const Duration(milliseconds: 1000),
                                // mode: TextScrollMode.bouncing,
                              ),
                            )),
                        Row(
                          children: [
                            Text(productList[index].price.toString(),
                                overflow: TextOverflow.ellipsis),
                            IconButton(
                                onPressed: () async {
                                  await deleteOnAlert(
                                      context,
                                      productList[index].id,
                                      productList[index].name);

                                  // _apiServices
                                  //     .deletProduct(productList[index].id);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
