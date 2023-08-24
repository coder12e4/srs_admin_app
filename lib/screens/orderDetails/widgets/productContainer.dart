import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/constants.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.img,
    required this.productName,
    required this.amount,
    this.size = "",
  });
  final String img;
  final String productName;
  final String size;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        
        Container(
          height: 350.h,
          width: MediaQuery.of(context).size.width / 0,
          decoration: BoxDecoration(
              color: greyShade,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: greyShade)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200.w,
                child: ClipRRect(
                  child: Image.asset(img),
                ),
              ),
              SizedBox(width: 30.w,),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: GoogleFonts.sora(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      size,
                      style: const TextStyle(fontSize: 12),
                    ),
                    kFormField30,
                    Text(
                      amount,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text("Qty : 1")
            ],
          ),
        )
      ]),
    );
  }
}
