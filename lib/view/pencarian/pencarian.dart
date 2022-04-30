import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/pencarian/pencarianController.dart';
import 'package:indomartel/view/pencarian/nopol.dart';

class Pencarian extends StatelessWidget {
  final PencarianController pencarianController =
      Get.put(PencarianController());
  Pencarian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Pencarian Data ( Keyboard )',
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
                SizedBox(
                  width: Get.width * 90 / 100,
                  child: ElevatedButton(
                    onPressed: () => pencarianController.seacrchData(),
                    child: Text("Cari Data"),
                  ),
                ),
                SizedBox(
                  height: Get.height * 2 / 100,
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
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PencarianWidgetCard extends StatelessWidget {
  const PencarianWidgetCard({
    Key? key,
    required this.nopol,
    required this.mesin,
    required this.rangka,
    required this.nama,
  }) : super(key: key);

  final String nopol;
  final String mesin;
  final String rangka;
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      height: Get.height * 30 / 100,
      width: Get.width * 90 / 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              (nopol != "tidak ditemukan")
                  ? "Data Ditemukan"
                  : "Tidak Ditemukan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nomor Polisi"),
                  Text(nopol),
                ],
              ),
              DividerCostom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nomor Rangka"),
                  Text(rangka),
                ],
              ),
              DividerCostom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nomor Mesin"),
                  Text(mesin),
                ],
              ),
              DividerCostom(),
              Text("Tipe Kendaraan : "),
              Text(
                nama,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DividerCostom extends StatelessWidget {
  const DividerCostom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 1,
      margin: EdgeInsets.only(top: 4, bottom: 4),
    );
  }
}
