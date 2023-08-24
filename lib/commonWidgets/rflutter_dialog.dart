import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void deleteOnAlert(context, snap, CollectionReference ref) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Delete Alert",
    desc: "Do you want to delete this product ${snap['Product Name']}.",
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
          ref.doc(snap.id).delete();
          Navigator.of(context).pop();

          AnimatedSnackBar.material(
            "The product ${snap['Product Name']} is deleted",
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
