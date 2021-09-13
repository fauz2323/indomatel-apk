import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/auth/forgotController.dart';
import 'package:indomartel/view/auth/widget/formPassword.dart';
import 'package:indomartel/view/auth/widget/formdata.dart';

class ForgotPass extends StatelessWidget {
  final ForgotController forgotController = Get.put(ForgotController());
  ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
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
                "Lupa Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(30),
                  height: height * 70 / 100,
                  width: width * 80 / 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Obx(
                    () => (forgotController.load.value)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FormDaftar(
                                usernameController:
                                    forgotController.emailController,
                                icon: Icons.mail,
                                label: "Email",
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    forgotController.load.value = true;
                                    if (forgotController.emailController.text ==
                                        '') {
                                      Get.snackbar("Error", "Email Kosong");
                                    } else {
                                      forgotController.otp(forgotController
                                          .emailController.text);
                                    }
                                  },
                                  child: Text("Get OTP password")),
                              FormDaftar(
                                usernameController:
                                    forgotController.otpController,
                                icon: Icons.mail,
                                label: "kode OTP",
                              ),
                              FormPassword(
                                usernameController:
                                    forgotController.newpass2Controller,
                                icon: Icons.lock,
                                label: "Password",
                                lock: true,
                              ),
                              FormPassword(
                                usernameController:
                                    forgotController.newpassController,
                                icon: Icons.lock,
                                label: "Re-type Password",
                                lock: true,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    forgotController.load.value = true;
                                    if (forgotController
                                            .newpass2Controller.text !=
                                        forgotController
                                            .newpassController.text) {
                                      Get.snackbar(
                                          "Error", "password tidak sama");
                                    } else if (forgotController
                                                .emailController.text ==
                                            '' ||
                                        forgotController.otpController.text ==
                                            '' ||
                                        forgotController
                                                .newpass2Controller.text ==
                                            '') {
                                      Get.snackbar(
                                          "Error", "Form tidak boleh kosong");
                                    } else {
                                      forgotController.proses(
                                          forgotController.otpController.text,
                                          forgotController.emailController.text,
                                          forgotController
                                              .newpassController.text);
                                    }
                                  },
                                  child: Text('Submit'))
                            ],
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
