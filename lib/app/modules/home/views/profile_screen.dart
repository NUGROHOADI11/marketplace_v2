import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_v2/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  final HomeController controll = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown,
        child: Column(
          children: [
            Container(
              width: width,
              color: const Color(0xffEEDCC6),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/splash1.jpg'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      print('click');
                    },
                    child: Container(
                        height: 25,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange),
                        child: Center(
                          child: Text(
                            "Change",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: const Color(0xffFFF5E9),
                  borderRadius: BorderRadius.circular(10)),
              child:  ListTile(
                title: Text("Username"),
                subtitle: Text(controll.userName),
                trailing: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: const Color(0xffFFF5E9),
                  borderRadius: BorderRadius.circular(10)),
              child: const ListTile(
                title: Text("Gender"),
                subtitle: Text("huhiuhuh"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: const Color(0xffFFF5E9),
                  borderRadius: BorderRadius.circular(10)),
              child:  ListTile(
                title: const Text("Email"),
                subtitle: Text(controll.email),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: const Color(0xffFFF5E9),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(children: [
                ListTile(
                  title: Text("Language"),
                  trailing: Text("English"),
                ),
                ListTile(
                  title: Text("Notification"),
                  trailing: Text("on"),
                ),
                ListTile(
                  title: Text("Help Center"),
                  trailing: Text("Help"),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                await logoutUser();
              },
              child: Container(
                  height: 40,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black38),
                  child: Center(
                    child: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
