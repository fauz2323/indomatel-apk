import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/setting/editPasswordController.dart';

class EditPasswrd extends StatelessWidget {
  final EditPasswordController editPasswordController =
      Get.put(EditPasswordController());
  EditPasswrd({Key? key}) : super(key: key);

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Ganti Password"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                height: height * 50 / 100,
                // padding: EdgeInsets.all(20),
                width: width * 70 / 100,
                child: Obx(
                  () => (editPasswordController.load.value)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText:
                                    editPasswordController.secure.value,
                                controller: editPasswordController
                                    .passwordOldController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.lock),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: IconButton(
                                        icon: (editPasswordController
                                                .secure.value)
                                            ? Icon(Icons.remove_red_eye)
                                            : Icon(
                                                Icons.remove_red_eye_outlined),
                                        onPressed: () {
                                          editPasswordController.secure.value =
                                              !editPasswordController
                                                  .secure.value;
                                        }),
                                  ),
                                  labelText: "Password lama",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText:
                                    editPasswordController.secure.value,
                                controller: editPasswordController
                                    .passwordNewController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.lock_outline),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: IconButton(
                                        icon: (editPasswordController
                                                .secure.value)
                                            ? Icon(Icons.remove_red_eye)
                                            : Icon(
                                                Icons.remove_red_eye_outlined),
                                        onPressed: () {
                                          editPasswordController.secure.value =
                                              !editPasswordController
                                                  .secure.value;
                                        }),
                                  ),
                                  labelText: "Password baru",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText:
                                    editPasswordController.secure.value,
                                controller: editPasswordController
                                    .passwordNewController2,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.lock_outline),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: IconButton(
                                        icon: (editPasswordController
                                                .secure.value)
                                            ? Icon(Icons.remove_red_eye)
                                            : Icon(
                                                Icons.remove_red_eye_outlined),
                                        onPressed: () {
                                          editPasswordController.secure.value =
                                              !editPasswordController
                                                  .secure.value;
                                        }),
                                  ),
                                  labelText: "Re-Type Password baru",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (editPasswordController
                                          .passwordNewController.text !=
                                      editPasswordController
                                          .passwordNewController2.text) {
                                    Get.snackbar("Message",
                                        "password baru dan re-type password baru tidak sama");
                                  } else {
                                    editPasswordController.load.value = true;
                                    editPasswordController.change(
                                      editPasswordController
                                          .passwordOldController.text,
                                      editPasswordController
                                          .passwordNewController.text,
                                    );
                                  }
                                },
                                child: Text("Submit")),
                          ],
                        ),
                )),
          ),
        ),
      ),
    );
  }
}
