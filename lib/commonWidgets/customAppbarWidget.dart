import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBArWidget extends StatelessWidget {
  const CustomAppBArWidget({
    super.key,
    required this.title,
    required this.size,
  });
  final String title;
 final int size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          SizedBox(
            width: size.w,
          ),
          Text(
            title,
            style: GoogleFonts.laila(
                fontSize: 80.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

