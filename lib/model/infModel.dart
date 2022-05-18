class InfoModel {
  InfoModel({
    required this.exp,
    required this.lastUpdate,
    required this.balance,
  });

  DateTime exp;
  DateTime lastUpdate;
  num balance;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        exp: DateTime.parse(json["exp"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        balance: json["balance"],
      );
}
