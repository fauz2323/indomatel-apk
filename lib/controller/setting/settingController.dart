import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:indomartel/model/userData.dart';
import 'package:indomartel/view/auth/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SettingController extends GetxController {
  final storage = new FlutterSecureStorage();
  late DataUser data;
  var uri = Uri.parse('https://indomatel.com/api/authtest');
  var load = true.obs;
  var token;

  initialize() async {
    print("object");
    token = await storage.read(key: 'token');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      data = DataUser.fromJson(json.decode(response.body)['data']);
      load.value = false;
    }
  }

  logout() async {
    final boxHive = await Hive.openBox('boxMatel');
    print(boxHive.length);
    boxHive.clear();
    await storage.deleteAll();
    Get.offAll(Login());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialize();
  }
}
