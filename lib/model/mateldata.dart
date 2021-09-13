import 'package:hive/hive.dart';
part 'mateldata.g.dart';

@HiveType(typeId: 3)
class Mateldata extends HiveObject {
  Mateldata({
    required this.id,
    required this.tipeKendaraan,
    required this.nomorRangka,
    required this.nomorMesin,
    required this.nopol,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  String tipeKendaraan;
  @HiveField(2)
  String nomorRangka;
  @HiveField(3)
  String nomorMesin;
  @HiveField(4)
  String nopol;

  factory Mateldata.fromJson(Map<String, dynamic> json) => Mateldata(
        id: json["id"],
        tipeKendaraan: json["tipeKendaraan"],
        nomorRangka: json["nomorRangka"],
        nomorMesin: json["nomorMesin"],
        nopol: json["nopol"],
      );
}
