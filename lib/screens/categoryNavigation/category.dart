import 'package:ecommerce_admin/commonWidgets/customAppbarWidget.dart';
import 'package:ecommerce_admin/screens/addProducts.dart/addEquipmentScreen.dart';
import 'package:ecommerce_admin/screens/addProducts.dart/addingOutfitsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryNavScreen extends StatelessWidget {
  const CategoryNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAppBArWidget(title: "Category", size: 222),
          SizedBox(height: 100.h),
          InkWell(
            onTap: () {
              AddingEquipmentsScreen.selectedValueNotifier.value = '';
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  AddingEquipmentsScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(50.w),
              padding: EdgeInsets.all(30.w),
              height: 800.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "asset/category/Sports Equipments.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text("Equipment",
                      style: GoogleFonts.lilitaOne(fontSize: 100.sp))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AddingOutfitsScreen.selectedValueNotifier.value='';
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddingOutfitsScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(50.w),
              padding: EdgeInsets.all(30.w),
              height: 900.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "asset/category/Sports Outfits.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text("OutFits",
                      style: GoogleFonts.lilitaOne(fontSize: 100.sp))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
