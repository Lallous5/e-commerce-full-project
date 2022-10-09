// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_using_getx/routes/routes.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 190),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: TextUtils(
                      text: "Welcome",
                      fontSize: 35,
                      color: Colors.white,
                      fontweight: FontWeight.bold,
                      underline: TextDecoration.none,
                    )),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                          text: "LALLOUS",
                          fontSize: 35,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underline: TextDecoration.none,
                        ),
                        TextUtils(
                          text: "  Shop",
                          fontSize: 30,
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 220),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 13)),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      text: "Get Started",
                      fontSize: 22,
                      fontweight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Don't Have n Accont??",
                        fontSize: 18,
                        fontweight: FontWeight.w700,
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signupScreen);
                        },
                        child: TextUtils(
                          text: "Sign Up",
                          fontSize: 20,
                          fontweight: FontWeight.w500,
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
