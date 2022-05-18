class Atm {
  Atm({
    required this.atm,
    required this.atasnama,
    required this.bank,
    required this.wa,
  });

  String atm;
  String atasnama;
  String bank;
  String wa;

  factory Atm.fromJson(Map<String, dynamic> json) => Atm(
        atm: json["atm"],
        atasnama: json["atasnama"],
        bank: json["bank"],
        wa: json["wa"].toString(),
      );
}
