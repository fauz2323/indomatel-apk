class Mateldata {
  Mateldata({
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

  factory Mateldata.fromJson(Map<String, dynamic> json) => Mateldata(
        id: json["id"],
        tipeKendaraan: json["tipeKendaraan"],
        nomorRangka: json["nomorRangka"],
        nomorMesin: json["nomorMesin"],
        nopol: json["nopol"],
      );
}
