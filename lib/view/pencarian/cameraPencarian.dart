import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/pencarian/pencarianController.dart';
import 'package:indomartel/view/pencarian/nopol.dart';
import 'package:indomartel/view/pencarian/pencarian.dart';

class CameraSearch extends StatelessWidget {
  final PencarianController pencarianController =
      Get.put(PencarianController());
  CameraSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Pencarian Data ( Camera OCR )',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: TextField(
                        controller: pencarianController.controller,
                        // onChanged: pencarianController.onSearch,
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          pencarianController.controller.clear();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                    ),
                  ),
                ),
                // Obx(
                //   () => (pencarianController.load.value)
                //       ? Center(
                //           child: CircularProgressIndicator(),
                //         )
                //       : Expanded(
                //           child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //           ),
                //           child: (pencarianController.search.length != 0 ||
                //                   pencarianController.controller.text.isNotEmpty)
                //               ? ListView.builder(
                //                   itemCount: pencarianController.search.length,
                //                   itemBuilder: (context, i) {
                //                     final b = pencarianController.search[i];
                //                     return Material(
                //                       color: Colors.transparent,
                //                       child: InkWell(
                //                         onTap: () {
                //                           Get.to(() => Nopol(),
                //                               arguments: b.nopol);
                //                         },
                //                         child: Container(
                //                             padding: EdgeInsets.all(10.0),
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: <Widget>[
                //                                 Text(
                //                                   b.nopol,
                //                                   style: TextStyle(
                //                                       fontWeight: FontWeight.bold,
                //                                       fontSize: 18.0),
                //                                 ),
                //                                 SizedBox(
                //                                   height: 4.0,
                //                                 ),
                //                               ],
                //                             )),
                //                       ),
                //                     );
                //                   },
                //                 )
                //               : ListView.builder(
                //                   itemCount: pencarianController.data.length,
                //                   itemBuilder: (context, i) {
                //                     final a = pencarianController.data[i];
                //                     return Material(
                //                       color: Colors.transparent,
                //                       child: InkWell(
                //                         onTap: () {
                //                           Get.to(() => Nopol(),
                //                               arguments: a.nopol);
                //                         },
                //                         child: Container(
                //                             padding: EdgeInsets.all(10.0),
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: <Widget>[
                //                                 Text(
                //                                   a.nopol,
                //                                   style: TextStyle(
                //                                       fontWeight: FontWeight.bold,
                //                                       fontSize: 18.0),
                //                                 ),
                //                                 SizedBox(
                //                                   height: 4.0,
                //                                 ),
                //                               ],
                //                             )),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //         )),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      pencarianController.onScan();
                    },
                    child: Text("SCAN"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      pencarianController.seacrchData();
                    },
                    child: Text("Cari Data"),
                  ),
                ),
                Obx(
                  (() => (pencarianController.onData.value)
                      ? (pencarianController.load.value)
                          ? CircularProgressIndicator()
                          : Column(
                              children:
                                  pencarianController.newModel.data.map((e) {
                              return PencarianWidgetCard(
                                nama: e.tipeKendaraan,
                                nopol: e.nopol,
                                rangka: e.nomorRangka,
                                mesin: e.nomorMesin,
                              );
                            }).toList())
                      : (pencarianController.load.value)
                          ? CircularProgressIndicator()
                          : Text("Silahkan Cari Data")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
