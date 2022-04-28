import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indomartel/model/mateldata.dart';
import 'package:indomartel/view/home/home.dart';

class DownloadController extends GetxController {
  final storage = new FlutterSecureStorage();
  var uri = Uri.parse("https://indomatel.com/api/get-data");
  List<Mateldata> dataMatel = [];
  var total = 0.obs;
  var totalAwal = 0.obs;
  var token;
  var load = true.obs;
  var dataTotal = 0.obs;
  var end = false;

  initialize() async {
    final boxHive = await Hive.openBox('boxMatel');
    print(boxHive.length);
    total.value = boxHive.length;
  }

  loading() async {
    print("kk");
    load.value = false;
    token = await storage.read(key: 'token');
    final boxHive = await Hive.openBox('boxMatel');
    do {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      dataTotal.value = json.decode(response.body)['totalData'];
      var data = json.decode(response.body)['data']['data'];
      var dataMap = data as List;
      dataMap.forEach((element) {
        var datas = Mateldata.fromJson(element);
        totalAwal.value = totalAwal.value + 1;
        boxHive.put(datas.id, datas);
      });
      total.value = boxHive.length;
      print("k8887k");
    } while (end = true);

    // Get.off(Home());
    load.value = true;
    Get.snackbar("Message", "success download");
  }

  getTo() {
    Get.off(() => Home());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialize();
  }
}
