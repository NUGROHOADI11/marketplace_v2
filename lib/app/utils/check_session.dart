import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_v2/app/controllers/auth_controller.dart';
import 'package:marketplace_v2/app/routes/app_pages.dart';

class CheckSession extends StatefulWidget {
  const CheckSession({super.key});

  @override
  State<CheckSession> createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession> {
  @override
  void initState() {
    checkSession().then((value) {
      if (value) {
        Get.offNamed(Routes.ADMIN);
      } else {
        Get.offNamed(Routes.SPLASH);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        
        child: CircularProgressIndicator(),
      ),
    );
  }
}
