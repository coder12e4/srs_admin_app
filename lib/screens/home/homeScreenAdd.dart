import 'package:ecommerce_admin/commonWidgets/rflutter_dialog.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/screens/home/order_Widgets/orderScreen.dart';
import 'package:ecommerce_admin/screens/home/product_widgets/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenAddProduct extends StatelessWidget {
  const HomeScreenAddProduct({super.key});
 
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.white,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "List of produuct",
              style: GoogleFonts.anton(
                  fontWeight: FontWeight.w500,
                  fontSize: 70.sp,
                  color: darkShades),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
              color: darkShades,
            ),
            actions: [
              InkWell(
            
                onTap: () {
                  signOutDilogueBox(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 122.w,
                    child: ClipRRect(
                        child: Image.asset(
                            "asset/homeimages/smallprofile-removebg-preview.png")),
                  ),
                ),
                
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: darkShades,
              tabs: const [
                Tab(
                  text: 'Product',
                ),
                Tab(
                  text: 'Order',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            ProductScreen(),
            OrderScreen(),
          ])),
    );
  }
}
