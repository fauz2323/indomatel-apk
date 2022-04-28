import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:indomartel/model/mateldata.dart';
import 'package:indomartel/model/test2Model.dart';
import 'package:indomartel/model/testModel.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'view/splash.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pathData = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(pathData.path);
  Hive.registerAdapter(ModelsAdapter());
  Hive.registerAdapter(MateldataAdapter());
  Hive.registerAdapter(Model2Adapter());
  runApp(GetMaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
    ),
    home: Splash(),
  ));
}
