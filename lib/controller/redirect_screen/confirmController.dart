import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indomartel/model/AtmModel.dart';

class ConfirmController extends GetxController {
  final storage = new FlutterSecureStorage();
  var uri = Uri.parse("https://indomatel.com/api/getcodeunik");
  late Atm atm;
  var uri2 = Uri.parse("https://indomatel.com/api/getAtm");
  var token;
  var codeunik = 0.obs;
  var load = false.obs;
  var get = true.obs;

  initz() async {
    token = await storage.read(key: 'token');
    final response = await http.get(uri2, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      //
      final data = json.decode(response.body);
      atm = Atm.fromJson(data);
      print("WA adalah : ${atm.wa}");
      load.value = true;
    } else {
      load.value = true;
      Get.snackbar("Error", "connection Error");
    }
  }

  initial() async {
    print("object");
    token = await storage.read(key: 'token');
    print(token);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      codeunik.value = data['code'];
      print(data['wa']);
      get.value = false;
      load.value = true;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initz();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("object;");
  }
}
