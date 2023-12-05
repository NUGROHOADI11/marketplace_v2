import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:marketplace_v2/app/modules/home/views/cart_screen.dart';
import '../controllers/home_controller.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController controll = Get.put(HomeController());

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
                icon: Icons.home,
                text: 'Home',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
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
        return const HomeScreen();
      case 1:
        return CartScreen();
      case 2:
        return FavoriteScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}




