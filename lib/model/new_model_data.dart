class NewModelSearch {
  NewModelSearch({
    required this.data,
  });

  Data data;

  factory NewModelSearch.fromJson(Map<String, dynamic> json) => NewModelSearch(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.tipeKendaraan,
    required this.nomorRangka,
    required this.nomorMesin,
    required this.nopol,
  });

  String tipeKendaraan;
  String nomorRangka;
  String nomorMesin;
  String nopol;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tipeKendaraan: json["tipeKendaraan"],
        nomorRangka: json["nomorRangka"],
        nomorMesin: json["nomorMesin"],
        nopol: json["nopol"],
      );

  Map<String, dynamic> toJson() => {
        "tipeKendaraan": tipeKendaraan,
        "nomorRangka": nomorRangka,
        "nomorMesin": nomorMesin,
        "nopol": nopol,
      };
}
