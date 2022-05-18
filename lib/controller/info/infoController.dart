import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indomartel/model/AtmModel.dart';
import 'package:indomartel/model/infModel.dart';
import 'dart:convert';

import 'package:indomartel/view/info/info.dart';
import 'package:intl/intl.dart';

class InfoController extends GetxController {
  final storage = new FlutterSecureStorage();
  late InfoModel informasi;
  var uri = Uri.parse("https://indomatel.com/api/info");
  var token;
  var codeunik = 0.obs;
  var load = true.obs;
  late NumberFormat formatNumber;

  initialize() async {
    print("object");
    token = await storage.read(key: 'token');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body);
      informasi = InfoModel.fromJson(dataJson);
      formatNumber = NumberFormat.currency(locale: 'id', symbol: 'Rp.');
      print(formatNumber);
      load.value = false;
    }
  }

  pencairan(var bank, var atasNama, var jumlah) async {
    Map data = {bank: bank, atasNama: atasNama, jumlah: jumlah};
    print(data);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    initialize();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close");
  }
}
