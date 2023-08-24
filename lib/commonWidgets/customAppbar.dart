import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      // color: Colors.amberAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: 25,
          ),
          
          Text(
            "List of produuct",
            style: GoogleFonts.anton(
                fontWeight: FontWeight.w500, fontSize: 70.sp),
          ),
          
          SizedBox(
            height: 100.h,
            width: 100.w,
          
            child: ClipRRect(
                child:
                    Image.asset("asset/homeimages/smallprofile-removebg-preview.png")),
          )
        ],
      ),
    );
  }
}