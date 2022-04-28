import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/setting/settingController.dart';
import 'package:indomartel/view/setting/editEmail.dart';
import 'package:indomartel/view/setting/editpassword.dart';

class Setting extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());
  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("SETTING"),
      centerTitle: true,
    );
    return SafeArea(
      child: Container(
        height: 300,
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
          appBar: appBar,
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: height * 30 / 100,
                      color: Colors.transparent,
                      child: Image.asset('asset/image/setting.png'),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        height: height * 62 / 100 - appBar.preferredSize.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Obx(
                          () => (settingController.load.value)
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: height * 5 / 100,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${settingController.data.username}",
                                        ),
                                        Spacer(),
                                        Icon(Icons.people),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${settingController.data.email}",
                                        ),
                                        Spacer(),
                                        Icon(Icons.mail),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${settingController.data.nohp}",
                                        ),
                                        Spacer(),
                                        Icon(Icons.phone)
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                        child: GridView.count(
                                      crossAxisCount: 3,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(9),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(() => EditPasswrd());
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.lock),
                                                    Text("Edit Password"),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(9),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(() => EmailEdit());
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.mail),
                                                    Text("Edit Email"),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(9),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  settingController.logout();
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.logout),
                                                    Text("Log out"),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ],
                                    ))
                                  ],
                                ),
                        ))
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
