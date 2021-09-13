import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EditEmailController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final storage = new FlutterSecureStorage();
  var load = false.obs;
  var token;
  var uri = Uri.parse("https://indomatel.com/api/updatemail");

  editEmail(var email) async {
    token = await storage.read(key: 'token');
    Map body = {
      'emailnew': email,
    };
    final response = await http.post(uri, body: body, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    print(response.statusCode);

    if (response.statusCode == 201) {
      Get.snackbar("message", "Email sudah terpakai");
      load.value = false;
    } else if (response.statusCode == 200) {
      load.value = false;
      Get.back();
      Get.snackbar("message", "Email sukses diganti");
    } else {
      load.value = false;

      Get.snackbar("Error", "Error");
    }
  }
}
