import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/pencarian/nopolController.dart';

class Nopol extends StatelessWidget {
  final NopolController nopolController = Get.put(NopolController());
  Nopol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            title: Text('Detail Kendaraan'),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Obx(
            () => (nopolController.load.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        height: height * 30 / 100,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image.asset('asset/image/logo.png'),
                      ),
                      Container(
                        height: height * 58.81 / 100,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nomor Polisi"),
                                Text(nopolController.nopol.nopol),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Text("Jenis Kendaraan"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(nopolController.nopol.tipeKendaraan),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nomor Rangka"),
                                Text(nopolController.nopol.nomorRangka),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nomor Mesin'),
                                Text(nopolController.nopol.nomorMesin),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Terahir ditambahkan'),
                                Text(
                                    '${nopolController.nopol.createdAt.day} - ${nopolController.nopol.createdAt.month} - ${nopolController.nopol.createdAt.year}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
