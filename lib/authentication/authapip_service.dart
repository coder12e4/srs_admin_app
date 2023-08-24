import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_admin/const/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Authentication extends GetxService {
  RxString msg = ''.obs;
  Future<void> login(email, password) async {
    const url = baseUrl + loginUrl;
    log(url);
    try {
      Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };
      final encodeData = jsonEncode(loginData);

      var response = await http.post(
        Uri.parse(url),
        body: encodeData,
        headers: {'Content-Type': 'application/json'},
      );
      final decodedData = jsonDecode(response.body);
      if (decodedData['token'] != null) {
        log('login sucssecfull');
      } else {
        log('login failed');
      }

      log(decodedData['token']);
    } catch (e) {
      log('catch error${e.toString()}');
    }
  }

  Future<void> registration(name, email, password, mobileNum, dob) async {
    final client = http.Client();
    const regUrl = baseUrl + registrationUrl;
    log(regUrl);
    try {
      Map<String, dynamic> regData = {
        "name": name,
        "email": email,
        "mobileNumber": mobileNum,
        "dob": dob,
        "password": password
      };
      final encodedregBody = jsonEncode(regData);
      var response = await client.post(
        Uri.parse(regUrl),
        body: encodedregBody,
        headers: {'Content-Type': 'application/json'},
      );
      final decodedData = jsonDecode(response.body);
      msg.value = decodedData['msg'];
      log(decodedData['msg'].toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
