import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/redirect_screen/confirmController.dart';

class PopupAkun extends StatelessWidget {
  final ConfirmController confirmController = Get.put(ConfirmController());
  final text;
  final akun;
  PopupAkun({Key? key, this.text, this.akun}) : super(key: key);

  void whatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: confirmController.atm.wa,
          message: "Hello, bagaimana cara aktivasi aplikasi INDOMATEL?");
    } else {
      Get.snackbar("Error", "WhatsApp tidak ditemukan");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text(text),
      content: Obx(
        () => confirmController.load.value
            ? (akun)
                ? Container(
                    height: height * 40 / 100,
                    width: width * 40 / 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(confirmController.atm.bank),
                          Text(confirmController.atm.atm),
                          Text("A/N ${confirmController.atm.atasnama}"),
                          Text("sebesar : "),
                          Text('Rp. ${confirmController.codeunik.value}')
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: width * 50 / 100,
                    height: height * 40 / 100,
                    child: Column(
                      children: [
                        Text(
                          "Jika anda kesulitan untuk melakukan aktifasi aplikasi mohon untuk menghubungi admin dibawah ini...",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 60 / 100,
                          child: ElevatedButton(
                              onPressed: () {
                                whatsAppOpen();
                              },
                              child: Text("Whatsapp")),
                        ),
                        SizedBox(
                          width: width * 60 / 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.snackbar("Message", "Coming soon");
                            },
                            child: Text("Email"),
                          ),
                        ),
                      ],
                    ),
                  )
            : Container(
                height: height * 40 / 100,
                width: width * 40 / 100,
                child: Center(child: CircularProgressIndicator()),
              ),
      ),
      actions: [
        (akun)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        confirmController.load.value = false;
                        confirmController.initial();
                      },
                      child: Text('Ambil Code Unik')),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Tutup")),
                ],
              )
            : ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("tutup"))
      ],
    );
  }
}
