import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/authentication/widget_Tree.dart';
import 'package:ecommerce_admin/getx_manager/api_getx.dart';
import 'package:ecommerce_admin/getx_manager/sharedpreference_getx.dart';
import 'package:ecommerce_admin/screens/signIn/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final SharedPrefManager _sharedPrefManager = Get.find();
final ApiServices _apiServices = Get.find();
Future<void> deleteOnAlert(context, id, name) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Delete Alert",
    desc: "Do you want to delete this product $name.",
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        // color: const Color.fromRGBO(0, 179, 134, 1.0),
        gradient: const RadialGradient(radius: 2, colors: [
          Color.fromARGB(255, 0, 253, 34),
          Color.fromARGB(255, 43, 119, 53),
        ]),
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      DialogButton(
        onPressed: () {
          _apiServices.deletProduct(id, context);
          Navigator.of(context).pop();

          AnimatedSnackBar.material(
            "The product $name is deleted",
            type: AnimatedSnackBarType.warning,
          ).show(context);
        },
        gradient: const RadialGradient(radius: 2, colors: [
          Color.fromARGB(255, 255, 11, 11),
          Color.fromARGB(255, 119, 43, 43),
        ]),
        child: const Text(
          "Delete",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
    ],
  ).show();
}

signOutDilogueBox(context) {
  Alert(
    context: context,
    type: AlertType.info,
    title: "Signout",
    desc: "Are you sure?.",
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        // color: const Color.fromRGBO(0, 179, 134, 1.0),
        gradient: const RadialGradient(radius: 2, colors: [
          Color.fromARGB(255, 0, 253, 34),
          Color.fromARGB(255, 43, 119, 53),
        ]),
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      DialogButton(
        onPressed: () {
          // signOut();
          AnimatedSnackBar.material("SignOut Successfully",
                  type: AnimatedSnackBarType.info)
              .show(context);
          _sharedPrefManager
              .removeValue('token')
              .then((value) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WidgetTree(),
                  )));
          Navigator.of(context).pop();
        },
        gradient: const RadialGradient(radius: 2, colors: [
          Color.fromARGB(255, 255, 11, 11),
          Color.fromARGB(255, 119, 43, 43),
        ]),
        //  LinearGradient(colors: [
        //   Color.fromARGB(255, 170, 70, 70),
        //   Color.fromARGB(255, 250, 50, 50),
        // ]),
        child: const Text(
          "Signout",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
    ],
  ).show();
}
