// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:ecommerce_using_getx/logic/controllers/auth_controller.dart';
import 'package:ecommerce_using_getx/logic/controllers/cart_controller.dart';
import 'package:ecommerce_using_getx/logic/controllers/main_controller.dart';
import 'package:ecommerce_using_getx/routes/routes.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/screen/category_screen.dart';
import 'package:ecommerce_using_getx/views/screen/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/theme_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            drawer: Drawer(
              semanticLabel: "LALLOUS",
              elevation: 100,
              width: 240,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
              ),
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? darkGreyClr : mainColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                            scale: 1,
                            height: 66,
                            width: 66,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "LALLOUS",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser!.email.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 219, 185, 185),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.home,
                                size: 33,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                              ),
                              title: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.to(() => MainScreen());
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.favorite,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                size: 33,
                              ),
                              title: Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.to(() => CategoryScreen());
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                size: 33,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                              ),
                              title: Text(
                                "Setting",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.to(() => SettingScreen());
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.dark_mode,
                                size: 33,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                              ),
                              title: Text(
                                "DarkMode",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                ThemeController().changesTheme();
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.logout,
                                size: 33,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                              ),
                              title: Text(
                                "LogOut",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.defaultDialog(
                                    buttonColor:
                                        Get.isDarkMode ? pinkClr : mainColor,
                                    title: "Logout from app",
                                    middleText:
                                        "Are you sure you need to logout",
                                    middleTextStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    radius: 10,
                                    backgroundColor: Colors.grey,
                                    textCancel: "NOO",
                                    cancelTextColor: Colors.white,
                                    confirmTextColor: Colors.white,
                                    textConfirm: "YESS",
                                    onConfirm: () {
                                      authController.signOutUsingFirebase();
                                    },
                                    onCancel: () {
                                      // Get.back();
                                    });
                              },
                            ),
                          ],
                        ),
                        Text(
                          "Created by LALLOUS \u00a9 2022",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              title:
                  Text(mainController.title[mainController.currentIndex.value]),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Image.asset(
                      'assets/images/notification.png',
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    }),
                Obx(
                  () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: Image.asset(
                          'assets/images/card.png',
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.cartScreen);
                        }),
                  ),
                )
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                mainController.currentIndex.value = index;
              },
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              currentIndex: mainController.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/activebox.png",
                    height: 35,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  icon: Image.asset(
                    "assets/images/box.png",
                    height: 35,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/activehome.png",
                    height: 35,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  icon: Image.asset(
                    "assets/images/home.png",
                    height: 35,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                ),
                // BottomNavigationBarItem(
                //   activeIcon: Icon(
                //     Icons.favorite,
                //     color: Get.isDarkMode ? pinkClr : mainColor,
                //   ),
                //   icon: Icon(
                //     Icons.favorite,
                //     color: Get.isDarkMode ? Colors.white : Colors.black,
                //   ),
                //   label: "",
                // ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    "assets/images/activeuser.png",
                    height: 35,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  icon: Image.asset(
                    "assets/images/users.png",
                    height: 35,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: "",
                ),
              ],
            ),
            body: IndexedStack(
              index: mainController.currentIndex.value,
              // ignore: invalid_use_of_protected_member
              children: mainController.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
