import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indomartel/view/auth/login.dart';
import 'package:indomartel/view/screen_redirect/aktifasiemail.dart';
import 'package:indomartel/view/screen_redirect/confirmpurchase.dart';

class HomeController extends GetxController {
  final storage = new FlutterSecureStorage();
  var token;
  var uri = Uri.parse("https://indomatel.com/api/authtest");
  var load = true.obs;

  initial() async {
    print("masuk sini");
    token = await storage.read(key: 'token');

    print(token);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      load.value = false;
    } else if (response.statusCode == 222) {
      Get.off(ConfirmPurchase());
    } else if (response.statusCode == 201) {
      Get.off(Aktifasi());
    } else {
      print("aaa");
      storage.deleteAll();
      Get.off(Login());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }
}
