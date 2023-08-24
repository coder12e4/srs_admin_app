import 'package:ecommerce_admin/const/constants.dart';
import 'package:ecommerce_admin/screens/home/product_widgets/productCard.dart';
import 'package:ecommerce_admin/screens/home/product_widgets/product_outfis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../categoryNavigation/category.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CategoryNavScreen(),
            ));
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 180.h,
              width: MediaQuery.of(context).size.width / 1.2,
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: darkShades,
                tabs: const [
                  Tab(
                    text: 'Equipments',
                  ),
                  Tab(
                    text: 'Outfits',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 122.h,
            ),
            SizedBox(
              width: 900.w,
              height: 122.h,
              child: CupertinoSearchTextField(
                backgroundColor: greyShade,
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Expanded(
                child:
                    TabBarView(children: [ProductCard(), ProductOutfitsView()]))
          ],
        ),
      ),
    );
  }
}
