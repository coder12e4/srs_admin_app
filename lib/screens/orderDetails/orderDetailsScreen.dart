import 'package:ecommerce_admin/commonWidgets/customAppbarWidget.dart';
import 'package:ecommerce_admin/commonWidgets/customTextFormField.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/screens/orderDetails/widgets/addressContainer.dart';
import 'package:ecommerce_admin/screens/orderDetails/widgets/productContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBArWidget(title: "Order 123456789", size: 115),
          kHeadingSpace30,
          CustomTextField(title: "User Name :", wlength: 0, hintText: "Admin"),
          kHeadingSpace30,
          AddressContainer(),
          kHeadingSpace30,
          Row(
            mainAxisAlignment:MainAxisAlignment.start ,
            children: [
              SizedBox(width: 40.w,),
              Text(
              "Products :",
              style: GoogleFonts.sora(
                  textStyle:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
            ],
          ),
          ProductContainer(img: "asset/homeimages/Boots-removebg-preview.png", productName:"Adidas Messi Edition" ,size: "Uk 6",amount: "₹ 89,990"),
          ProductContainer(img: "asset/orderScreen/grip_socks-removebg-preview.png", productName: "Grip Socks", amount:"₹ 699" )
        ],
      ),
    );
  }
}


