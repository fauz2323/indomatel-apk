import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:indomartel/model/mateldata.dart';
import 'package:indomartel/model/test2Model.dart';
import 'package:indomartel/model/testModel.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pathData = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(pathData.path);
  Hive.registerAdapter(ModelsAdapter());
  Hive.registerAdapter(MateldataAdapter());
  Hive.registerAdapter(Model2Adapter());
  runApp(GetMaterialApp(
    home: Splash(),
  ));
}
