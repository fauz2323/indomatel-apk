import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/redirect_screen/confirmController.dart';

class PopupAkun extends StatelessWidget {
  final ConfirmController confirmController = Get.put(ConfirmController());
  final text;
  final akun;
  PopupAkun({Key? key, this.text, this.akun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text(text),
      content: (akun)
          ? Container(
              height: height * 40 / 100,
              width: width * 40 / 100,
              child: Center(
                  child: Obx(
                () => (confirmController.load.value)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(confirmController.atm.bank),
                          Text(confirmController.atm.atm),
                          Text("A/N ${confirmController.atm.atasnama}"),
                          Text("sebesar : "),
                          Text('Rp. ${confirmController.codeunik.value}')
                        ],
                      )
                    : CircularProgressIndicator(),
              )),
            )
          : Container(
              width: width * 50 / 100,
              height: height * 40 / 100,
              child: Column(
                children: [
                  Text(
                    "Jika anda bingung untuk melakukan aktifasi aplikasi mohon untuk menghubungi admin dibawah ini...",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.wallet_giftcard)),
                  ElevatedButton(onPressed: () {}, child: Text("Whatsapp")),
                  ElevatedButton(onPressed: () {}, child: Text("Email")),
                ],
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
