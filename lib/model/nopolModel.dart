class NopolModel {
  NopolModel({
    required this.id,
    required this.tipeKendaraan,
    required this.nomorRangka,
    required this.nomorMesin,
    required this.nopol,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String tipeKendaraan;
  String nomorRangka;
  String nomorMesin;
  String nopol;
  DateTime createdAt;
  DateTime updatedAt;

  factory NopolModel.fromJson(Map<String, dynamic> json) => NopolModel(
        id: json["id"],
        tipeKendaraan: json["tipeKendaraan"],
        nomorRangka: json["nomorRangka"],
        nomorMesin: json["nomorMesin"],
        nopol: json["nopol"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
