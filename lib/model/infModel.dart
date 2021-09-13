class InfoModel {
  InfoModel({
    required this.exp,
    required this.lastUpdate,
  });

  DateTime exp;
  DateTime lastUpdate;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        exp: DateTime.parse(json["exp"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );
}
