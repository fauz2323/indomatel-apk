import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:indomartel/model/mateldata.dart';
import 'package:indomartel/view/download_data/download_data.dart';
import 'package:indomartel/view/home/home.dart';

class PencarianController extends GetxController {
  final storage = new FlutterSecureStorage();
  var token;
  var load = true.obs;
  var uri = Uri.parse("uri");
  var data = <Mateldata>[].obs;
  var search = <Mateldata>[].obs;
  TextEditingController controller = new TextEditingController();

  initital() async {
    final boxHive = await Hive.openBox('boxMatel');
    print(boxHive.length);
    if (boxHive.isNotEmpty) {
      for (var i = 0; i < boxHive.length; i++) {
        data.add(boxHive.getAt(i));
      }
      load.value = false;
    } else {
      Get.off(Download());
    }
  }

  onSearch(String text) async {
    search.clear();
    if (text.isEmpty) {
      return;
    }

    data.forEach((f) {
      if (f.nopol.contains(text.toUpperCase())) {
        search.add(f);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initital();
  }
}
