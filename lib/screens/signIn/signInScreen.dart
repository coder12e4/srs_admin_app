import 'dart:developer';

import 'package:ecommerce_admin/authentication/authapip_service.dart';
import 'package:ecommerce_admin/screens/home/homeScreenAdd.dart';
import 'package:ecommerce_admin/screens/signUp/signUpScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../commonWidgets/loginTextForm.dart';
import '../../const/constants.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? errorMessage = '';
  bool isLogin = true;
  final Authentication authentication = Get.find();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Hum ? $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 300.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 500.h),
                  Text(
                    "SRS Admin",
                    style: GoogleFonts.raleway(
                        fontSize: 40, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              // Image.asset(
              //   'asset/loginImages/Login_Image-removebg-preview.png',
              //   // width: 800.w,
              //   // height: 600.h,
              //   scale: 2.5,
              // ),
              kFormField100,
              LoginTextForm(
                  prefixIcon: Icons.email,
                  hintText: "Email or Phone",
                  controller: _controllerEmail),
              kFormField30,
              LoginTextForm(
                prefixIcon: Icons.lock,
                hintText: "Password",
                passdot: true,
                controller: _controllerPassword,
              ),
              _errorMessage(),
              kFormField50,
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    performLogin();
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(900.w, 130.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  "Log In",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              // kFormField50,SS
              kFormField50,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New user?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    try {
      await authentication.login(
          _controllerEmail.text, _controllerPassword.text, context);
    } catch (e) {
      // Handle any exceptions that occur during login
      log('Login error: $e');
    }
  }
}
