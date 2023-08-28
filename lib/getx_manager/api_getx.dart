import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_admin/authentication/widget_Tree.dart';
import 'package:ecommerce_admin/const/api_url.dart';
import 'package:ecommerce_admin/getx_manager/sharedpreference_getx.dart';
import 'package:ecommerce_admin/models/allproducts_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxService {
  final SharedPrefManager _sharedPrefManager = Get.find();
  Future<List<ProductsDetails>> getAllPublicProduct() async {
    List<ProductsDetails> allProductsList = [];
    const allProductUrl = baseUrl + getAllProducts;
    final client = http.Client();

    try {
      var response = await client.get(Uri.parse(allProductUrl));

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        AllProductDataModel alldata = AllProductDataModel.fromJson(decodeData);
        List<ProductsDetails> extractedList = alldata.data;

        for (ProductsDetails element in extractedList) {
          ProductsDetails allProducts = element;
          allProductsList.add(allProducts);
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return allProductsList;
  }

  Future<void> updateProduct(
      productId, name, des, category, company, price) async {
    const updateUrl = baseUrl + updateProductUrl;
    final client = http.Client();
    final updateData = {
      "productId": productId,
      "name": name,
      "description": des,
      "category": category,
      "company": company,
      "price": price
    };
    final encodedData = jsonEncode(updateData);
    final authToken = _sharedPrefManager.getStringValue('token');
    log(authToken);
    try {
      var response = await client.post(
        Uri.parse(updateUrl),
        body: encodedData,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );
      log(response.statusCode.toString());
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deletProduct(productId, context) async {
    const deleteUrl = baseUrl + deleteProductUrl;
    final client = http.Client();
    final deleteData = {
      "productId": productId,
    };
    final encodedData = jsonEncode(deleteData);
    final authToken = _sharedPrefManager.getStringValue('token');
    log(authToken);
    try {
      var response = await client.post(
        Uri.parse(deleteUrl),
        body: encodedData,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );
      final decodedData = jsonDecode(response.body);
      if (decodedData['msg'] == "Product deleted!!!") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const WidgetTree(),
        ));
      }
      log(response.statusCode.toString());
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
