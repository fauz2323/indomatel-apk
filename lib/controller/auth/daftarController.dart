import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:indomartel/view/screen_redirect/aktifasiemail.dart';
import 'package:indomartel/view/screen_redirect/confirmpurchase.dart';

class DaftarController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContrller = TextEditingController();
  TextEditingController password2Contrller = TextEditingController();
  TextEditingController reffController = TextEditingController();
  TextEditingController noController = TextEditingController();
  var lock = true.obs;
  var load = false.obs;
  var uri = Uri.parse('https://indomatel.com/api/daftar');

  daftar(var username, var email, var password, var reff, var nohp) async {
    Map body = {
      'username': username,
      'password': password,
      'email': email,
      'reff': reff,
      'nohp': nohp,
    };
    final response = await http.post(uri, body: body);
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      if (res['message'] == 204) {
        Get.snackbar("Error", "${res['status']}");
      } else if (res['message'] == 202) {
        Get.snackbar("Error", "${res['status']}");
      } else if (res['message'] == 201) {
        Get.snackbar("Error", "${res['status']}");
      } else {
        Get.off(() => Aktifasi());
      }
    } else {
      Get.snackbar("Message", "Error COnnection");
    }
    load.value = false;
  }
}
