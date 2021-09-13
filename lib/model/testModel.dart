import 'package:hive/hive.dart';
part 'testModel.g.dart';

@HiveType(typeId: 1)
class Models extends HiveObject {
  Models({
    required this.name,
    required this.username,
    required this.email,
    required this.id,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;

  factory Models.fromJson(Map<String, dynamic> json) => Models(
        id: json['id'],
        name: json["name"]!,
        username: json["username"]!,
        email: json["email"]!,
      );
}
