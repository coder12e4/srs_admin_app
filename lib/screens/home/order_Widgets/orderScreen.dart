import 'package:ecommerce_admin/const/api_url.dart';
import 'package:ecommerce_admin/getx_manager/api_getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'orderWidget.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
 final ApiServices _apiServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 110.h,
          ),
          FutureBuilder(
            future: _apiServices.getAllPublicProduct(getAllOrderUrl),
            builder: (context, snapshot) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const OrderCardWidget(
                            color: Colors.green, status: "Delivered");
                      }));
            },
          )
        ],
      ),
    );
  }
}
