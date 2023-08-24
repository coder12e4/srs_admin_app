import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.title,
    this.action,
  });
  final String title;
  final Function()? action;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 900.h,
      height: 150.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // backgroundColor: darkShades,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        )),
        onPressed: action,
        child: Text(
          title,
          style: TextStyle(fontSize: 55.sp),
        ),
      ),
    );
  }
}
