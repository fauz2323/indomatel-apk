import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:indomartel/model/new_model_data.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
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
  var load = false.obs;
  var uri = Uri.parse("uri");
  Size? _previewOcr;
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  var data = <Mateldata>[].obs;
  var search = <Mateldata>[].obs;
  late NewModelSearch newModel;
  TextEditingController controller = new TextEditingController();
  var onData = false.obs;

  initital() async {
    final boxHive = await Hive.openBox('boxMatel');
    print(boxHive.length);

    // if (boxHive.isNotEmpty) {
    //   for (var i = 0; i < boxHive.length; i++) {
    //     data.add(boxHive.getAt(i));
    //   }
    //   load.value = false;
    // } else {
    //   Get.off(Download());
    // }
    load.value = false;
  }

  seacrchData() async {
    if (controller.text.length > 3) {
      load.value = true;
      final response = await http.post(
          Uri.parse('https://indomatel.com/api/nopol'),
          body: {'nopol': controller.text.replaceAll(' ', '')});
      final jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        newModel = NewModelSearch.fromJson(jsonData);
        print(newModel.data);
      } else if (response.statusCode == 404) {
        newModel = NewModelSearch.fromJson(jsonData);
      } else {
        print('jsonData');
      }
      onData.value = true;
      load.value = false;
    } else {
      Get.snackbar("Peringatan", "Minimal 4 huruf");
    }
  }

  onSearch(String text) async {
    print(text);
    // search.clear();
    // if (text.isEmpty) {
    //   return;
    // }

    // data.forEach((f) {
    //   if (f.nopol.contains(text.toUpperCase())) {
    //     search.add(f);
    //   }
    // });
    load.value = true;
    final response = await http.post(
        Uri.parse('https://indomatel.com/api/nopol'),
        body: {'nopol': controller.text});
    final jsonData = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      newModel = NewModelSearch.fromJson(jsonData);
      print(newModel.data);
    } else if (response.statusCode == 404) {
      newModel = NewModelSearch.fromJson(jsonData);
    } else {
      print('jsonData');
    }
    onData.value = true;
    load.value = false;
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
    Size _scanpreviewOcr = _previewOcr ?? FlutterMobileVision.PREVIEW;
    print(_scanpreviewOcr.width);

    try {
      texts = await FlutterMobileVision.read(
        autoFocus: true,
        multiple: true,
        fps: 2.0,
        showText: true,
        camera: _cameraOcr,
        preview: _previewOcr!,
        scanArea: Size(
          (Get.width + 400).toInt(),
          (Get.height * 20 / 100).toInt(),
        ),
      );
      print(texts);
      if (texts.first.value.length > 7) {
        print("1");
        controller.text = texts.first.value.replaceAll(' ', '').substring(0, 8);
      } else {
        print("2");
        controller.text = texts.first.value.replaceAll(' ', '').substring(0, 5);
      }
      onSearch(controller.text);
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initital();
    FlutterMobileVision.start()
        .then((value) => _previewOcr = value[_cameraOcr]!.first);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close");
  }
}
