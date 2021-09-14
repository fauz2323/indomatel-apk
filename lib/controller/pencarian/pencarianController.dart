import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:indomartel/model/mateldata.dart';
import 'package:indomartel/view/download_data/download_data.dart';
import 'package:indomartel/view/home/home.dart';

class PencarianController extends GetxController {
  final storage = new FlutterSecureStorage();
  var token;
  var text = ''.obs;
  var status = 'Listen'.obs;
  var listen = true.obs;
  stt.SpeechToText speech = stt.SpeechToText();

  var isListening = false.obs;
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

  onListen() async {
    print("object");
    if (!isListening.value) {
      print("1");
      bool available = await speech.initialize(
        onStatus: (val) => status.value = val,
        onError: (val) => Get.snackbar("Error", val.toString()),
      );
      if (available) {
        print("11");
        isListening.value = true;
        speech.listen(onResult: (val) {
          controller.text = val.recognizedWords;
          onSearch(val.recognizedWords.replaceAll(' ', ''));
        });
        isListening.value = false;
      }
    } else {
      isListening.value = false;
      listen.value = true;
      print("12");
      speech.stop();
    }
  }

  onScan() async {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initital();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close");
  }
}
