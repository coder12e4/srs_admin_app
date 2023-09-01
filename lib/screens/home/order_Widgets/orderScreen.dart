import 'dart:developer';

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
            future: _apiServices.getAllOrders(getAllOrderUrl),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final orderList = snapshot.data;
                // log(orderList![0].id.toString());
                if (orderList!.isNotEmpty) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: orderList.length,
                          itemBuilder: (context, index) {
                            log(orderList.length.toString());
                            return OrderCardWidget(
                              color: Colors.green,
                              status: "Delivered",
                              orderData: orderList[index],
                            );
                          }));
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
