import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:indomartel/model/test2Model.dart';
import 'package:indomartel/model/testModel.dart';

import 'package:indomartel/view/download_data/download_data.dart';
import 'package:indomartel/view/home/home.dart';
import 'package:indomartel/view/screen_redirect/aktifasiemail.dart';
import 'package:indomartel/view/screen_redirect/confirmpurchase.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final storage = new FlutterSecureStorage();
  var uri = Uri.parse("https://indomatel.com/api/login");
  List<String> model = [];
  var load = false.obs;
  var token;
  var secure = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  initial() async {}

  // login(var username, var password) async {
  //   Map body = {
  //     'username':username,
  //     'password':password,
  //   };
  // }

  login(var username, var password) async {
    load.value = true;
    print("pass : $password");
    print("user: $username");
    Map body = {'username': username, 'password': password};
    final response = await http.post(
      uri,
      body: body,
    );

    var dataresponse = json.decode(response.body);

    if (response.statusCode == 200) {
      //
      print(dataresponse['token']);
      await storage.write(key: 'token', value: dataresponse['token']);
      print(token);

      print('test');
      load.value = false;
      Get.off(Home());
    } else if (response.statusCode == 301) {
      await storage.write(key: 'token', value: dataresponse['token']);

      // Get.off(ConfirmPurchase());
      load.value = false;
      print("non");
      Get.off(() => Aktifasi());
    } else if (response.statusCode == 401) {
      load.value = false;
      Get.snackbar("Message", "Username/Password Salah");
    } else if (response.statusCode == 222) {
      await storage.write(key: 'token', value: dataresponse['token']);

      load.value = false;
      Get.off(ConfirmPurchase());
    }
    load.value = false;
  }

  store() async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    final boxHive = await Hive.openBox('boxs2');

    final response = await http.get(uri);
    var data = json.decode(response.body);
    var dataMap = data as List;
    dataMap.forEach((element) {
      var datas = Model2.fromJson(element);
      print(datas);
      boxHive.put(datas.title, datas);
    });
  }

  read() async {
    final boxHive = await Hive.openBox('boxs2');
    print(boxHive.length);
    boxHive.clear();
  }

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }
}
