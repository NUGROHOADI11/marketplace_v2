import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:marketplace_v2/app/modules/admin/views/product_screen.dart';
import 'package:marketplace_v2/app/modules/admin/views/profile_screen.dart';
import '../controllers/admin_controller.dart';
import 'dashboard_screen.dart';

class AdminView extends GetView<AdminController> {
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  AdminView({Key? key}) : super(key: key);
  final AdminController controll = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFEEDCC6),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Haloo, ${controll.userName}",
                  style: GoogleFonts.sora(
                    color: const Color(0xff230C02),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, size: 30, color: Color(0xff230C02),),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications, size: 30, color: Color(0xff230C02),),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: _buildBody(controll.currentNavIndex.value),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xffEEDCC6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 6,
            activeColor: const Color(0xff230C02),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: const Color.fromARGB(255, 177, 165, 149),
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.dashboard,
                text: 'Dashboard',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'Product',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconColor: Color(0xff230C02),
              ),
            ],
            selectedIndex: controll.currentNavIndex.value,
            onTabChange: (index) {
              controll.currentNavIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const DashboardScreen();
      case 2:
        return ProductScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}
