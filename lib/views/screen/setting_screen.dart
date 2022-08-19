import 'package:ecommerce_using_getx/logic/controllers/auth_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/theme_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changesTheme();
              },
              child: Text(
                "Dark Mode",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 22),
              ),
            ),
            SizedBox(height: 30),
            GetBuilder<AuthController>(builder: (controller) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                      title: "Logout from app",
                      middleText: "Are you sure you need to logout",
                      radius: 30,
                      textCancel: "NOO",
                      cancelTextColor: Colors.white,
                      confirmTextColor: Colors.white,
                      textConfirm: "YESS",
                      onConfirm: () {
                        controller.signOutUsingFirebase();
                      },
                      onCancel: () {
                        Get.back();
                      });
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 22),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
