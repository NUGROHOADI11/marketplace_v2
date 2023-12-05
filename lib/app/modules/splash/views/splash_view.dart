import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';
import 'splash2.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
              height: height * 0.8,
              width: width * 1,
              child: Image.asset(
                "assets/images/splash1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * 0.35,
                width: width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sushi so good,\nyour taste buds\nwill love it.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            fontSize: 33,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "The best fish, the finest fish,\nthe powerful fish.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      // Spacer(),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => const Splash2());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Splash2()),
                          );
                        },
                        child: Container(
                            height: height * 0.065,
                            width: width * 0.75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFFDC5F00)),
                            child: Center(
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.001,
                      ),

                      SizedBox(
                        height: height * 0.02,
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
