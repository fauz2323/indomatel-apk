import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/splashController.dart';

class Splash extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('asset/image/logo.png'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Version 1.0.0.m712"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
