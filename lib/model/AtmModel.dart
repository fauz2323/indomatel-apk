class Atm {
  Atm({
    required this.atm,
    required this.atasnama,
    required this.bank,
  });

  String atm;
  String atasnama;
  String bank;

  factory Atm.fromJson(Map<String, dynamic> json) => Atm(
        atm: json["atm"],
        atasnama: json["atasnama"],
        bank: json["bank"],
      );
}
