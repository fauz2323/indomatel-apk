import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/auth/daftarController.dart';
import 'package:indomartel/view/auth/widget/formPassword.dart';
import 'package:indomartel/view/auth/widget/formdata.dart';

class Daftar extends StatelessWidget {
  final DaftarController daftarController = Get.put(DaftarController());
  Daftar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Daftar",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Obx(
          () => (daftarController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    FormDaftar(
                      usernameController: daftarController.userController,
                      icon: Icons.people_alt,
                      label: "Username",
                    ),
                    FormDaftar(
                      usernameController: daftarController.emailController,
                      icon: Icons.email,
                      label: "Email",
                    ),
                    FormDaftar(
                      usernameController: daftarController.noController,
                      icon: Icons.phone,
                      label: "Nomor HP",
                    ),
                    FormPassword(
                      usernameController: daftarController.passwordContrller,
                      icon: Icons.lock,
                      label: "Password",
                    ),
                    FormPassword(
                      usernameController: daftarController.password2Contrller,
                      icon: Icons.lock,
                      label: "Re-type Password",
                    ),
                    FormDaftar(
                      usernameController: daftarController.reffController,
                      icon: Icons.supervised_user_circle,
                      label: "Sponsor",
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 255, 135, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.only(left: 30, right: 30)),
                      onPressed: () {
                        if (daftarController.passwordContrller.text !=
                            daftarController.password2Contrller.text) {
                          Get.snackbar("Pesan", "Password tidak Cocok");
                        } else if (daftarController.userController.text == '' ||
                            daftarController.emailController.text == '' ||
                            daftarController.passwordContrller.text == '' ||
                            daftarController.reffController.text == '' ||
                            daftarController.noController.text == '') {
                          Get.snackbar("Message", "form tidak boleh kosong");
                        } else {
                          daftarController.load.value = true;

                          daftarController.daftar(
                              daftarController.userController.text,
                              daftarController.emailController.text,
                              daftarController.passwordContrller.text,
                              daftarController.reffController.text,
                              daftarController.noController.text);
                        }
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
        )),
      ),
    );
  }
}
