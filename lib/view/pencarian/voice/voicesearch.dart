import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/pencarian/pencarianController.dart';
import 'package:indomartel/view/pencarian/nopol.dart';
import 'package:indomartel/view/pencarian/pencarian.dart';

class VoiceSearch extends StatelessWidget {
  final PencarianController pencarianController =
      Get.put(PencarianController());
  VoiceSearch({Key? key}) : super(key: key);

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
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Pencarian Data ( Voice )',
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
                        enabled: false,
                        controller: pencarianController.controller,
                        // onChanged: pencarianController.onSearch,
                        decoration: InputDecoration(
                            hintText: "Nomor Polisi", border: InputBorder.none),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          pencarianController.controller.clear();
                          pencarianController.onSearch('');
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
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //             ),
                //             child: (pencarianController.search.length != 0 ||
                //                     pencarianController
                //                         .controller.text.isNotEmpty)
                //                 ? ListView.builder(
                //                     itemCount: pencarianController.search.length,
                //                     itemBuilder: (context, i) {
                //                       final b = pencarianController.search[i];
                //                       return Material(
                //                         color: Colors.transparent,
                //                         child: InkWell(
                //                           onTap: () {
                //                             Get.to(() => Nopol(),
                //                                 arguments: b.nopol);
                //                           },
                //                           child: Container(
                //                               padding: EdgeInsets.all(10.0),
                //                               child: Column(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: <Widget>[
                //                                   Text(
                //                                     b.nopol,
                //                                     style: TextStyle(
                //                                         fontWeight:
                //                                             FontWeight.bold,
                //                                         fontSize: 18.0),
                //                                   ),
                //                                   SizedBox(
                //                                     height: 4.0,
                //                                   ),
                //                                 ],
                //                               )),
                //                         ),
                //                       );
                //                     },
                //                   )
                //                 : ListView.builder(
                //                     itemCount: pencarianController.data.length,
                //                     itemBuilder: (context, i) {
                //                       final a = pencarianController.data[i];
                //                       return Material(
                //                         color: Colors.transparent,
                //                         child: InkWell(
                //                           onTap: () {
                //                             Get.to(() => Nopol(),
                //                                 arguments: a.nopol);
                //                           },
                //                           child: Container(
                //                               padding: EdgeInsets.all(10.0),
                //                               child: Column(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: <Widget>[
                //                                   Text(
                //                                     a.nopol,
                //                                     style: TextStyle(
                //                                         fontWeight:
                //                                             FontWeight.bold,
                //                                         fontSize: 18.0),
                //                                   ),
                //                                   SizedBox(
                //                                     height: 4.0,
                //                                   ),
                //                                 ],
                //                               )),
                //                         ),
                //                       );
                //                     },
                //                   ),
                //           ),
                //         ),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 33, 185, 255),
                    ),
                    onPressed: () {
                      pencarianController.seacrchData();
                    },
                    child: Text(
                      "Cari Data",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 33, 185, 255),
                    ),
                    onPressed: () {
                      pencarianController.onListen();
                    },
                    child: Obx(
                      () => Text(
                        pencarianController.status.value.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
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
                      : Text("Silahkan Cari Data")),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     pencarianController.onListen();
                //   },
                //   child: Text('Start'),
                //   style: ElevatedButton.styleFrom(
                //     padding: EdgeInsets.only(left: 40, right: 40),
                //     primary: Color.fromRGBO(0, 255, 135, 1),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
