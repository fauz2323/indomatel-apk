import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:indomartel/model/mateldata.dart';
import 'package:indomartel/view/download_data/download_data.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

class PencarianController extends GetxController {
  final storage = new FlutterSecureStorage();
  var token;
  List<OcrText> texts = [];
  var text = ''.obs;
  var isInitialize = false.obs;
  var status = 'Listen'.obs;
  var listen = true.obs;
  stt.SpeechToText speech = stt.SpeechToText();

  var isListening = false.obs;
  var load = true.obs;
  var uri = Uri.parse("uri");
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
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

  onScan() async {
    try {
      texts = await FlutterMobileVision.read(
        autoFocus: true,
        multiple: true,
        fps: 2.0,
        waitTap: true,
      );
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initital();
    FlutterMobileVision.start();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close");
  }
}
