import 'package:ecommerce_admin/screens/signUp/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginTextForm extends StatelessWidget {
  LoginTextForm({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.passdot = false,
    required this.controller,
  });

  IconData prefixIcon;
  String hintText;
  bool passdot;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: passdot,
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color(0xFF00B212D),
            ),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xFF00B212D),
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        cursorColor: const Color(0xFF00B212D),
      ),
    );
  }
}
