import 'package:ecommerce_admin/getx_manager/sharedpreference_getx.dart';
import 'package:ecommerce_admin/screens/home/homeScreenAdd.dart';
import 'package:ecommerce_admin/screens/signIn/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final SharedPrefManager _sharedPrefManager = Get.find();
  @override
  Widget build(BuildContext context) {
    final token = _sharedPrefManager.getStringValue('token');
    
    return token.isNotEmpty ? HomeScreenAddProduct() : LoginScreen();
  }
}
