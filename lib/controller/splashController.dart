import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:indomartel/view/auth/login.dart';
import 'package:indomartel/view/home/home.dart';
import 'package:package_info/package_info.dart';

class SplashController extends GetxController {
  initial() async {
    final storage = new FlutterSecureStorage();
    var value = await storage.read(key: 'token');
    var duration = Duration(seconds: 4);
    return Timer(duration, () async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      if (value != null) {
        Get.off(() => Home(), transition: Transition.zoom);
      } else {
        Get.off(() => Login(), transition: Transition.fade);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }
}
