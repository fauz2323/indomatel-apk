import 'package:hive/hive.dart';
part 'test2Model.g.dart';

@HiveType(typeId: 2)
class Model2 extends HiveObject {
  Model2({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @HiveField(0)
  int albumId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  String url;
  @HiveField(4)
  String thumbnailUrl;

  factory Model2.fromJson(Map<String, dynamic> json) => Model2(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
