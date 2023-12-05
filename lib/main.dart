import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marketplace_v2/app/controllers/save_data.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/check_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Marketplace",
      initialRoute: "/",
      getPages: AppPages.routes,
      home: const CheckSession(),
      debugShowCheckedModeBanner: false,
    );
  }
}
