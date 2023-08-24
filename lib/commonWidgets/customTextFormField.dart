import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/constants.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.wlength,
    required this.hintText,
  });
  final String title;
  final double wlength;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          title,
          style: GoogleFonts.sora(
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 150.h,
          width: MediaQuery.of(context).size.width/wlength,
          decoration: BoxDecoration(
              color: greyShade,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: greyShade)),
          child: Padding(
            padding:  EdgeInsets.only(left: 40.w,top: 40.w),
             child: Text(hintText,style: GoogleFonts.ubuntu(
                height: 1.3,
                textStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold
                ),
              ),),
            // TextFormField(
            //   cursorColor: Colors.black,
            //   minLines: 1,
            //   maxLines: 1,
            //   textAlignVertical: TextAlignVertical.center,
            //   decoration: InputDecoration(
            //     hintText: hintText,
            //     hintStyle: GoogleFonts.ubuntu(
            //       height: 1.3,
            //       textStyle: TextStyle(color: Colors.grey, fontSize: 50.sp),
            //     ),
            //     filled: true,
            //     fillColor: Colors.transparent,
            //     border: InputBorder.none,
            //   ),
            //   style: GoogleFonts.ubuntu(
            //     height: 1.3,
            //     textStyle: TextStyle(
            //       color: Colors.black,
            //       fontSize: 50.sp,
            //     ),
            //   ),
            // ),
          ),
        )
      ]),
    );
  }
}
