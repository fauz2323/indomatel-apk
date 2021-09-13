import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/auth/loginController.dart';
import 'package:indomartel/view/auth/daftar.dart';
import 'package:indomartel/view/auth/forgot.dart';
import 'package:indomartel/view/screen_redirect/aktifasiemail.dart';
import 'package:indomartel/view/screen_redirect/confirmpurchase.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Obx(
              () => (loginController.load.value)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                      children: [
                        Container(
                            height: height * 40 / 100,
                            width: width,
                            child: Image.asset(
                              'asset/image/logo.png',
                              height: height * 20 / 100,
                              width: width * 20 / 100,
                            )),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          height: height * 60 / 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextFormField(
                                  controller:
                                      loginController.usernameController,
                                  decoration: InputDecoration(
                                    labelText: "username",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.mail_outlined),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                  obscureText: loginController.secure.value,
                                  controller:
                                      loginController.passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: IconButton(
                                          icon: (loginController.secure.value)
                                              ? Icon(Icons.remove_red_eye)
                                              : Icon(Icons
                                                  .remove_red_eye_outlined),
                                          onPressed: () {
                                            loginController.secure.value =
                                                !loginController.secure.value;
                                          }),
                                    ),
                                    labelText: "Password",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.lock_clock_rounded),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          Get.to(() => ForgotPass());
                                        },
                                        child: Text("Forgot Password?"))),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(0, 255, 135, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30)),
                                    onPressed: () {
                                      loginController.login(
                                          loginController
                                              .usernameController.text,
                                          loginController
                                              .passwordController.text);
                                    },
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 10,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(0, 255, 135, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30)),
                                    onPressed: () {
                                      Get.to(() => Daftar());
                                      // loginController.read();
                                    },
                                    child: Text(
                                      "DAFTAR",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
            )),
      ),
    );
  }
}
