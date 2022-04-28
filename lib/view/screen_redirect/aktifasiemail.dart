import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/view/auth/login.dart';

class Aktifasi extends StatelessWidget {
  const Aktifasi({Key? key}) : super(key: key);

  back() {
    Get.off(() => Login());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
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
                "Konfirmasi Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    Image.asset('asset/image/mail.png'),
                    SizedBox(
                      height: height * 20 / 100,
                    ),
                    Text(
                      "Konfirmasi Email anda untuk melanjutkan...",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
