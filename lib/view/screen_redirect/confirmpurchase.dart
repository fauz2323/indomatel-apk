import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:indomartel/view/auth/login.dart';
import 'package:indomartel/view/screen_redirect/widget/confirmAkun.dart';

class ConfirmPurchase extends StatelessWidget {
  ConfirmPurchase({Key? key}) : super(key: key);
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Container(
        width: width,
        height: height,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Aplikasi Terkunci!!!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(30),
              height: height * 70 / 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Image.asset('asset/image/error.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Maaf aplikasi anda terkunci, untuk menggunakan aplikasi ini mohn hubungi ADMIN/CS kami. Terima Kasih",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => PopupAkun(
                                  text: "INFO REKENING",
                                  akun: true,
                                ));
                      },
                      child: Text("INFO REKENING")),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => PopupAkun(
                                  text: "INFO ADMIN",
                                  akun: false,
                                ));
                      },
                      child: Text("INFO ADMIN")),
                  ElevatedButton(
                      onPressed: () async {
                        storage.deleteAll();
                        Get.off(() => Login());
                      },
                      child: Text("Logout")),
                  Text(
                      "*Jika sudah melakukan transfer tetapi akun belum aktif mohon hubungi ADMIN/CS kami. Terima Kasih")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
