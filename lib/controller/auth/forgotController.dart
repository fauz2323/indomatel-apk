import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:indomartel/view/auth/login.dart';

class ForgotController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController newpass2Controller = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var load = false.obs;
  var url1 = Uri.parse('https://indomatel.com/api/sendotp');
  var url = Uri.parse('https://indomatel.com/api/lupapassword');
  otp(var email) async {
    Map body = {
      'email': email,
    };
    final response = await http.post(url1, body: body);
    if (response.statusCode == 201) {
      load.value = false;
      Get.snackbar("Error", "Email tidak ditemukan");
    } else if (response.statusCode == 200) {
      load.value = false;
      Get.snackbar("Message", "Otp sukses dikirim ke Email");
    } else {
      load.value = false;
      Get.snackbar("error", "Error connection");
    }
  }

  proses(var otp, var email, var passnew) async {
    Map body = {
      'email': email,
      'newpass': passnew,
      'otp': otp,
    };

    final response = await http.post(url, body: body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      load.value = false;
      Get.snackbar("error", "OTP salah");
    } else if (response.statusCode == 200) {
      load.value = false;
      Get.back();
      Get.snackbar("message", "Password berhasil diperbarui");
    } else if (response.statusCode == 202) {
      load.value = false;
      Get.snackbar("Error", "OTP tidak ditemukan");
    } else {
      load.value = false;
      Get.snackbar("Error", "Connection Error");
    }
  }
}
