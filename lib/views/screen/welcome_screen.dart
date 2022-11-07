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
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Get.isDarkMode ? darkGreyClr : mainColor,
                Get.isDarkMode
                    ? darkGreyClr.withOpacity(0.4)
                    : mainColor.withOpacity(0.4),
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: Stack(
                      fit: StackFit.passthrough,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          "assets/images/Rectangle.png",
                          color: Get.isDarkMode
                              ? pinkClr.withOpacity(0.78)
                              : mainColor,
                        ),
                        Positioned(
                          top: -70,
                          left: 100,
                          child: Image.asset(
                            "assets/images/onlineshopping.png",
                            height: 250,
                          ),
                        ), //Container
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 5,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 13)),
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: TextUtils(
                    text: "Get Started",
                    fontSize: 20,
                    fontweight: FontWeight.bold,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    underline: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: "Don't Have n Accont??",
                      fontSize: 16,
                      fontweight: FontWeight.w700,
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signupScreen);
                      },
                      child: TextUtils(
                        text: "SignUp",
                        fontSize: 14,
                        fontweight: FontWeight.w500,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        underline: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),

        //  Stack(
        //   children: [
        //     SizedBox(
        //       width: double.infinity,
        //       height: double.infinity,
        //       child: Image.asset(
        //         'assets/images/background.png',
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Container(
        //       color: Colors.black.withOpacity(0.3),
        //       width: double.infinity,
        //       height: double.infinity,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SizedBox(height: 190),
        //           Container(
        //             height: 60,
        //             width: 190,
        //             decoration: BoxDecoration(
        //               color: Colors.black.withOpacity(0.5),
        //               borderRadius: BorderRadius.circular(5),
        //             ),
        //             child: Center(
        //                 child: TextUtils(
        //               text: "Welcome",
        //               fontSize: 35,
        //               color: Colors.white,
        //               fontweight: FontWeight.bold,
        //               underline: TextDecoration.none,
        //             )),
        //           ),
        //           SizedBox(height: 10),
        //           Container(
        //             height: 60,
        //             width: 250,
        //             decoration: BoxDecoration(
        //               color: Colors.black.withOpacity(0.5),
        //               borderRadius: BorderRadius.circular(5),
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: const [
        //                 TextUtils(
        //                   text: "LALLOUS",
        //                   fontSize: 35,
        //                   fontweight: FontWeight.bold,
        //                   color: mainColor,
        //                   underline: TextDecoration.none,
        //                 ),
        //                 TextUtils(
        //                   text: "  Shop",
        //                   fontSize: 30,
        //                   fontweight: FontWeight.bold,
        //                   color: Colors.white,
        //                   underline: TextDecoration.none,
        //                 ),
        //               ],
        //             ),
        //           ),
        //           SizedBox(height: 220),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //       primary: mainColor,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //       padding:
        //           EdgeInsets.symmetric(horizontal: 40, vertical: 13)),
        //   onPressed: () {
        //     Get.offNamed(Routes.loginScreen);
        //   },
        //   child: TextUtils(
        //     text: "Get Started",
        //     fontSize: 22,
        //     fontweight: FontWeight.bold,
        //     color: Colors.white,
        //     underline: TextDecoration.none,
        //   ),
        // ),

        // SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextUtils(
        //       text: "Don't Have n Accont??",
        //       fontSize: 18,
        //       fontweight: FontWeight.w700,
        //       color: Colors.white,
        //       underline: TextDecoration.none,
        //     ),
        //     TextButton(
        //       onPressed: () {
        //         Get.offNamed(Routes.signupScreen);
        //       },
        //       child: TextUtils(
        //         text: "Sign Up",
        //         fontSize: 20,
        //         fontweight: FontWeight.w500,
        //         color: Colors.white,
        //         underline: TextDecoration.none,
        //       ),
        //     ),
        //   ],
        // ),

        // ],
        // ),
        // )
        // ],
        // ),
      ),
    );
  }
}
