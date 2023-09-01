import 'dart:developer';
import 'package:ecommerce_admin/authentication/authapip_service.dart';
import 'package:ecommerce_admin/commonWidgets/loginTextForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/constants.dart';
import '../signIn/signInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Authentication authentication = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                SizedBox(height: 200.h),
                Text(
                  "Sign Up",
                  style: GoogleFonts.raleway(
                      fontSize: 40, fontWeight: FontWeight.w800),
                ),
                kFormField100,
                //   ],
                // ),
                LoginTextForm(
                    prefixIcon: Icons.abc,
                    hintText: "Name",
                    controller: nameController),
                kFormField30,
                LoginTextForm(
                    prefixIcon: Icons.email,
                    hintText: "Email",
                    controller: emailController),
                kFormField30,
                LoginTextForm(
                    prefixIcon: Icons.password,
                    hintText: "Password",
                    controller: passwordController,
                    passdot: true),
                kFormField30,
                LoginTextForm(
                    prefixIcon: Icons.password,
                    hintText: "Confirm Password",
                    controller: confirmPasswordController,
                    passdot: true),
                kFormField30,
                LoginTextForm(
                    prefixIcon: Icons.mobile_friendly_rounded,
                    hintText: "Mobile number",
                    controller: mobileNumController,
                    passdot: false),
                kFormField30,
                LoginTextForm(
                    prefixIcon: Icons.date_range,
                    hintText: "DOb : 2001-01-02",
                    controller: dobController,
                    passdot: false),
                kFormField100,
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate() &&
                        passwordController.text ==
                            confirmPasswordController.text) {
                      _formkey.currentState!.save();

                      try {
                        await performRegister(); // Wait for the registration process
                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          animation: const AlwaysStoppedAnimation(2),

                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          content:
                              Text(authentication.msg.value), // Use .value here
                          duration: const Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        // After showing the snackbar, navigate to the login screen
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));

                        log('key pressed');
                      } catch (e) {
                        // Handle any exceptions that occur during registration
                        log('Registration error: $e');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(900.w, 130.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                kFormField50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account !"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> performRegister() async {
    try {
      await authentication.registration(
          nameController.text,
          emailController.text,
          passwordController.text,
          mobileNumController.text,
          dobController.text);
    } catch (e) {
      // Handle any exceptions that occur during login
      log('Login error: $e');
    }
  }
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController mobileNumController = TextEditingController();
TextEditingController dobController = TextEditingController();

String? validator(controller) {
  if (controller == null || controller == "") {
    return 'This field is required';
  } else {
    return null;
  }
}
