import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditPasswordController extends GetxController {
  final storage = new FlutterSecureStorage();
  TextEditingController passwordNewController = TextEditingController();
  TextEditingController passwordOldController = TextEditingController();
  TextEditingController passwordNewController2 = TextEditingController();
  var uri = Uri.parse("https://indomatel.com/api/updatepassword");
  var load = false.obs;
  var secure = true.obs;
  var token;

  change(var oldpass, var newpass) async {
    print(oldpass);
    print(newpass);
    token = await storage.read(key: 'token');
    Map body = {
      'oldpass': oldpass,
      'newpass': newpass,
    };
    final response = await http.post(uri, body: body, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar("message", "Password Sukses Diganti");
      load.value = false;
    } else if (response.statusCode == 201) {
      Get.snackbar("message", "Password Lama Tidak Cocok");
      load.value = false;
    } else {
      Get.snackbar("title", "Error");
      load.value = false;
    }
  }
}
