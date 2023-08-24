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
  });
  final String status;
  final Color color;
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
              "Order 123456789",
              style: GoogleFonts.nunito(
                  fontSize: 50.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              status,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
