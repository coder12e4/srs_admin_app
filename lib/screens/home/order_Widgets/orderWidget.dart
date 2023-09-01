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
            builder: (context) => const OrderDetailsScreen(),
          ),
        );
      },
      child: Container(
        height: orderData.orderItems.length * 90 + 20.h,
        width: 1000.w,
        margin:
            EdgeInsets.only(left: 70.w, bottom: 50.w, right: 70.w, top: 20.w),
        decoration: BoxDecoration(
          color: greyShade,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            kFormField50,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   height: 50.h,
                // ),
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
            kFormField30,
            Expanded(
              child: ListView.builder(
                itemCount: orderData.orderItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250.h,
                      child: Row(
                        children: [
                          Container(
                            height: 250.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      orderData.orderItems[index].image,
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderData.orderItems[index].name.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                kFormField10,
                                Text(
                                  orderData.orderItems[index].price.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                kFormField10,
                                Text(
                                  orderData.orderItems[index].quantity
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
