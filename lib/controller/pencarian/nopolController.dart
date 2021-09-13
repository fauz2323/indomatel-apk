import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:indomartel/model/nopolModel.dart';

class NopolController extends GetxController {
  var token;
  final storage = new FlutterSecureStorage();
  late NopolModel nopol;
  var load = true.obs;

  var uri = Uri.parse('https://indomatel.com/api/detail/${Get.arguments}');
  initialize() async {
    token = await storage.read(key: 'token');
    print(uri);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      nopol = NopolModel.fromJson(data);
      load.value = false;
    } else {
      Get.back();
      Get.snackbar("Error", 'Connection Error');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialize();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close");
  }
}
