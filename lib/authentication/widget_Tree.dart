// import 'package:ecommerce_admin/authentication/auth.dart';
// import 'package:ecommerce_admin/screens/home/homeScreenAdd.dart';
// import 'package:ecommerce_admin/screens/signIn/signInScreen.dart';
// import 'package:flutter/material.dart';

// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});

//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }

// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const HomeScreenAddProduct();
//         }else{
//           return const LoginScreen();
//         }
        
//       },
//     );
//   }
// }
