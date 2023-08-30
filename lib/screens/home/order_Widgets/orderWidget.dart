import 'package:ecommerce_admin/models/allorder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/constants.dart';
import '../../orderDetails/orderDetailsScreen.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.status,
    required this.color,
    required this.orderData,
  });
  final String status;
  final Color color;
  final Allorderdetails orderData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(),
          ),
        );
      },
      child: Container(
        height: 200.h,
        width: 1000.w,
        margin:
            EdgeInsets.only(left: 70.w, bottom: 50.w, right: 70.w, top: 20.w),
        decoration: BoxDecoration(
          color: greyShade,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SizedBox(width: 50.w,),
            Text(
              orderData.id,
              style: GoogleFonts.nunito(
                  fontSize: 50.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              orderData.status,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
