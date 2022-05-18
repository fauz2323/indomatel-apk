import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indomartel/controller/info/infoController.dart';

class PencairanDana extends StatelessWidget {
  final InfoController infoController;
  TextEditingController bank = TextEditingController();
  TextEditingController atasNama = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  PencairanDana({Key? key, required this.infoController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Pencairan Dana"),
      content: Container(
        height: Get.height * 40 / 100,
        width: Get.height * 40 / 100,
        child: Column(
          children: [
            FormWidget(
              controller: bank,
              nama: "Bank",
            ),
            FormWidget(
              controller: atasNama,
              nama: "Atas Nama",
            ),
            FormWidget(
              controller: jumlah,
              nama: "Jumlah",
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  infoController.pencairan(
                      bank.text, atasNama.text, jumlah.text);
                },
                child: Text('Proses')),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Tutup")),
          ],
        )
      ],
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.controller,
    required this.nama,
  }) : super(key: key);

  final TextEditingController controller;
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: nama,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.greenAccent, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}
