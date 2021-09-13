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
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Pencarian Data'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      controller: pencarianController.controller,
                      onChanged: pencarianController.onSearch,
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
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
              Obx(
                () => (pencarianController.load.value)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: (pencarianController.search.length != 0 ||
                                pencarianController.controller.text.isNotEmpty)
                            ? ListView.builder(
                                itemCount: pencarianController.search.length,
                                itemBuilder: (context, i) {
                                  final b = pencarianController.search[i];
                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => Nopol(),
                                            arguments: b.nopol);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                b.nopol,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                            ],
                                          )),
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: pencarianController.data.length,
                                itemBuilder: (context, i) {
                                  final a = pencarianController.data[i];
                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => Nopol(),
                                            arguments: a.nopol);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                a.nopol,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                            ],
                                          )),
                                    ),
                                  );
                                },
                              ),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
