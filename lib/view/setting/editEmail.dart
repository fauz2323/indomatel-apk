import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/setting/editEmailController.dart';

class EmailEdit extends StatelessWidget {
  final EditEmailController editEmailController =
      Get.put(EditEmailController());
  EmailEdit({Key? key}) : super(key: key);

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
          centerTitle: true,
          title: Text("Edit Email"),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                height: height * 30 / 100,
                width: width * 70 / 100,
                child: Obx(
                  () => (editEmailController.load.value)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: editEmailController.emailController,
                                decoration: InputDecoration(
                                  labelText: "Email baru",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.mail),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  editEmailController.load.value = true;
                                  editEmailController.editEmail(
                                      editEmailController.emailController.text);
                                },
                                child: Text("Submit"))
                          ],
                        ),
                )),
          ),
        ),
      ),
    );
  }
}
