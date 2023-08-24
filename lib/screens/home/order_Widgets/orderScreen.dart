import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'orderWidget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 110.h,
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 10,
            itemBuilder: (context, index){
              if(index%2==0){
              return const OrderCardWidget(color: Colors.green, status: "Delivered");
              }else{
                return OrderCardWidget(color: Colors.blue.shade900, status: "Shipped");
              }
            }
                
          ))
        ],
      ),
    );
  }
}
