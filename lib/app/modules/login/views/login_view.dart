import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  @override
  LoginController controller = Get.find<LoginController>();

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: height * 1.8,
          width: width * 1.8,
          child: Image.asset(
            "assets/images/login.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: height * 0.5,
            width: width * 0.9,
            child: Text(
              "Welcome\nBack!",
              style: GoogleFonts.sora(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: height * 0.38,
            width: width * 0.9,
            child: Center(
                child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: controller.emailControl,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Change the color as needed
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Change the color as needed
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: controller.passControl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Change the color as needed
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Change the color as needed
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      controller.logIn(
                          email: controller.emailControl.text,
                          pass: controller.passControl.text);
                      // try {
                      //   await loginUser(emailControl.text, passControl.text)
                      //       .then((value) {
                      //     if (value == true) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(content: Text("Login Success")));
                      //       Get.offAllNamed(Routes.HOME);
                      //     } else {
                      //       ScaffoldMessenger.of(context)
                      //           .showSnackBar(SnackBar(content: Text(value)));
                      //     }
                      //   });
                      // } catch (error) {
                      //   print("Error during registration: $error");
                      // }
                    },
                    child: Container(
                        height: 50,
                        width: 900,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF230C02)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have any account?",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                        child: Text(
                          "Register",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
          ),
        ),
      ]),
    );
  }
}
