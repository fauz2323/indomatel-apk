import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/home/homeController.dart';
import 'package:indomartel/view/download_data/download_data.dart';
import 'package:indomartel/view/home/widgetMenu.dart';
import 'package:indomartel/view/info/info.dart';
import 'package:indomartel/view/pencarian/menuPencarian.dart';
import 'package:indomartel/view/pencarian/pencarian.dart';
import 'package:indomartel/view/setting/setting.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => (homeController.load.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    height: height * 55 / 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(0, 255, 135, 1),
                          Color.fromRGBO(96, 239, 255, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            margin: EdgeInsets.all(10),
                            height: height * 30 / 100,
                            child: Image.asset('asset/image/logo.png')),
                      ),
                      Column(
                        children: [
                          WidgetMenu(
                            H: height * 20 / 100,
                            W: width * 90 / 100,
                            icon: Icons.search,
                            text: "Pencarian",
                            onPressed: () {
                              Get.to(() => MenuPencarian());
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WidgetMenu(
                                H: height * 20 / 100,
                                W: width * 40 / 100,
                                icon: Icons.people,
                                text: "Perpanjang Akun",
                                onPressed: () {
                                  Get.to(() => Info());
                                },
                              ),
                              WidgetMenu(
                                H: height * 20 / 100,
                                W: width * 40 / 100,
                                icon: Icons.settings,
                                text: "Setting",
                                onPressed: () {
                                  Get.to(() => Setting());
                                },
                              ),
                            ],
                          )
                        ],
                      )
                      // Expanded(
                      //   child: GridView.count(
                      //     crossAxisCount: 2,
                      //     children: [
                      //       WidgetMenu(
                      //         icon: Icons.search,
                      //         text: "Pencarian",
                      //         onPressed: () {
                      //           Get.to(() => MenuPencarian());
                      //         },
                      //       ),
                      //       WidgetMenu(
                      //         icon: Icons.download,
                      //         text: "Download Data",
                      //         onPressed: () {
                      //           Get.off(() => Download());
                      //         },
                      //       ),
                      //       WidgetMenu(
                      //         icon: Icons.people,
                      //         text: "Info Perpanjang Akun",
                      //         onPressed: () {
                      //           Get.to(() => Info());
                      //         },
                      //       ),
                      //       WidgetMenu(
                      //         icon: Icons.settings,
                      //         text: "Setting",
                      //         onPressed: () {
                      //           Get.to(() => Setting());
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
      )),
    );
  }
}
