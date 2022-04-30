class NewModelSearch {
  NewModelSearch({
    required this.data,
  });

  List<Datum> data;

  factory NewModelSearch.fromJson(Map<String, dynamic> json) => NewModelSearch(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.tipeKendaraan,
    required this.nomorRangka,
    required this.nomorMesin,
    required this.nopol,
  });

  int id;
  String tipeKendaraan;
  String nomorRangka;
  String nomorMesin;
  String nopol;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tipeKendaraan: json["tipeKendaraan"],
        nomorRangka: json["nomorRangka"],
        nomorMesin: json["nomorMesin"],
        nopol: json["nopol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipeKendaraan": tipeKendaraan,
        "nomorRangka": nomorRangka,
        "nomorMesin": nomorMesin,
        "nopol": nopol,
      };
}
