import 'package:headset_connection_event/headset_event.dart';
import 'package:get/get.dart';

class MenuPencarianController extends GetxController {
  HeadsetState? headsetState;
  final headsetPlugin = HeadsetEvent();
  initialize() async {
    await headsetPlugin.getCurrentState.then((val) => headsetState = val);
    print(Get.arguments);
    headsetPlugin.setListener((val) => headsetState = val);
    print(headsetState);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialize();
  }
}
