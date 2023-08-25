import 'package:ecommerce_admin/authentication/authapip_service.dart';
import 'package:ecommerce_admin/authentication/widget_Tree.dart';
import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/firebase_options.dart';
import 'package:ecommerce_admin/getx_manager/api_getx.dart';
import 'package:ecommerce_admin/getx_manager/sharedpreference_getx.dart';
import 'package:ecommerce_admin/screens/signIn/signInScreen.dart';
import 'package:ecommerce_admin/state_management/add_equipmenmt.dart';
import 'package:ecommerce_admin/state_management/add_outfits.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async {
    final service = SharedPrefManager();
    await service.init();
    return service;
  });

  Get.put(Authentication());
  Get.put(ApiServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AddEquipmentProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AddingOutfitsPovider(),
          )
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(backgroundColor: darkShades),
              ),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: darkShades)),
          home: const WidgetTree(),
        ),
      ),
      designSize: const Size(1080, 2340),
    );
  }
}
