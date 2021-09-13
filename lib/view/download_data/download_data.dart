import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/download/downloadController.dart';
import 'package:indomartel/controller/pencarian/pencarianController.dart';

class Download extends StatelessWidget {
  final DownloadController downloadController = Get.put(DownloadController());
  Download({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        return downloadController.getTo();
      },
      child: Container(
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
            title: Text(""),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Column(
              children: [
                Text(
                  "Update Data",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: height * 10 / 100,
                ),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Terahir diperbarui"),
                    Spacer(),
                    Text("20-01-2021")
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.file_download),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Total Data"),
                    Spacer(),
                    Obx(() => Text("${downloadController.total.value}")),
                  ],
                ),
                SizedBox(
                  height: height * 5 / 100,
                ),
                Obx(
                  () => (downloadController.load.value)
                      ? Icon(
                          Icons.verified,
                          size: 70,
                          color: Color.fromRGBO(0, 255, 135, 1),
                        )
                      : CircularProgressIndicator(
                          color: Color.fromRGBO(0, 255, 135, 1),
                        ),
                ),
                ElevatedButton(
                  onPressed: () {
                    downloadController.loading();
                  },
                  child: Text(
                    "Download Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                // Obx(
                //   () => (downloadController.load.value)
                //       ? Text('')
                //       : Obx(
                //           () => Text(
                //               "${downloadController.totalAwal.value} / ${downloadController.dataTotal.value}"),
                //         ),
                // ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
