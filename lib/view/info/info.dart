import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/info/infoController.dart';
import 'package:indomartel/view/info/widget/pencairan.dart';
import 'package:indomartel/view/screen_redirect/widget/confirmAkun.dart';

class Info extends StatelessWidget {
  final InfoController infoController = Get.put(InfoController());
  Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppBar appbar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Information"),
    );
    print(appbar.preferredSize.height);
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
          appBar: appbar,
          body: Stack(
            children: [
              Container(
                  child: Obx(
                () => (infoController.load.value)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Container(
                            height: (height * 30 / 100) -
                                appbar.preferredSize.height,
                            width: width,
                            color: Colors.transparent,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            height:
                                height * 69 / 100 - appbar.preferredSize.height,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Informasi Akun",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 10 / 100,
                                ),
                                Row(
                                  children: [
                                    Text("Masa Aktif"),
                                    Spacer(),
                                    Text(
                                        "${infoController.informasi.exp.day} - ${infoController.informasi.exp.month} - ${infoController.informasi.exp.year}"),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text("Terahir Perpanjang"),
                                    Spacer(),
                                    Text(
                                        "${infoController.informasi.lastUpdate.day} - ${infoController.informasi.lastUpdate.month} - ${infoController.informasi.lastUpdate.year}")
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text("Saldo Bonus"),
                                    Spacer(),
                                    Text(infoController.formatNumber.format(
                                        infoController.informasi.balance))
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: height * 5 / 100,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 50,
                                        right: 50),
                                    backgroundColor:
                                        Color.fromRGBO(0, 255, 135, 1),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            PopupAkun(
                                              text: "Pembayaran",
                                              akun: true,
                                            ));
                                  },
                                  child: Text(
                                    "Perpanjang Masa Aktif",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 50,
                                          right: 50),
                                      backgroundColor:
                                          Color.fromRGBO(0, 255, 135, 1),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            PencairanDana(
                                                infoController: infoController),
                                      );
                                    },
                                    child: Text(
                                      "Cairkan Dana",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
                          )
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
