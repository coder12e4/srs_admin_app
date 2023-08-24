import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/constants.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Address",
          style: GoogleFonts.sora(
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 500.h,
          width: MediaQuery.of(context).size.width / 0,
          decoration: BoxDecoration(
              color: greyShade,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: greyShade)),
          child: Padding(
            padding: EdgeInsets.only(left: 80.w, top: 35.w),
            child: Text(
              "Shenpoy Nivas A N Puram east Gate Alappuzha",
              style: GoogleFonts.ubuntu(
                height: 1.3,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
    );
  }
}