import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:indomartel/controller/pencarian/menuPencarianController.dart';
import 'package:indomartel/view/pencarian/cameraPencarian.dart';
import 'package:indomartel/view/pencarian/pencarian.dart';
import 'package:indomartel/view/pencarian/voice/voicesearch.dart';

class MenuPencarian extends StatelessWidget {
  final MenuPencarianController menuPencarianController =
      Get.put(MenuPencarianController());
  MenuPencarian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(0, 255, 135, 1),
            Color.fromRGBO(96, 239, 255, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Pencarian"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MenuPencarianWidget(
                fun: () {
                  Get.to(() => Pencarian(), arguments: 'Keyboard');
                },
                tittle: "Keyboard",
                icon: Icons.keyboard,
              ),
              MenuPencarianWidget(
                fun: () {
                  if (menuPencarianController.headsetState ==
                      HeadsetState.CONNECT) {
                    Get.to(() => VoiceSearch(), arguments: 'Voice');
                  } else {
                    Get.snackbar('Error', 'Pasang Headset terlebih dahulu');
                  }
                },
                tittle: "Suara ( Voice )",
                icon: Icons.mic,
              ),
              MenuPencarianWidget(
                fun: () {
                  Get.to(() => CameraSearch());
                },
                tittle: "Camera",
                icon: Icons.camera,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class MenuPencarianWidget extends StatelessWidget {
  final IconData icon;
  final tittle;
  final VoidCallback fun;
  const MenuPencarianWidget({
    Key? key,
    required this.icon,
    this.tittle,
    required this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      margin: EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: fun,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Icon(icon), Text(tittle)],
          ),
        ),
      ),
    );
  }
}
