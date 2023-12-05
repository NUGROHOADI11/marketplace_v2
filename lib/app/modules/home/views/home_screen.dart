import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Tabs/all_content.dart';
import 'Tabs/new_content.dart';
import 'Tabs/popular_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffEEDCC6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "What would you like\nyour sushi today?",
                    style: GoogleFonts.sora(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const TabBar(
                  tabAlignment: TabAlignment.center,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Color(0xffBD6306),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  indicatorPadding: EdgeInsets.all(10),
                  labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                  labelPadding: EdgeInsets.symmetric(horizontal: 25),
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Popular"),
                    Tab(text: "New"),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      AllContent(),
                      PopularContent(), // Use the new TabContent widget
                      NewContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
