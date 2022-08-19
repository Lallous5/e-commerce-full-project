// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_using_getx/logic/controllers/main_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              leading: Container(),
              elevation: 0,
              title:
                  Text(mainController.title[mainController.currentIndex.value]),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: Image.asset('assets/images/shop.png'),
                ),
              ],
              backgroundColor: Get.isDarkMode ?  darkGreyClr : mainColor,
            ),
           
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                mainController.currentIndex.value = index;
              },
              backgroundColor: Get.isDarkMode ? darkGreyClr:Colors.white  ,
              currentIndex: mainController.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ?  pinkClr:mainColor ,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ?Colors.white :Colors.black  ,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ?  pinkClr:mainColor ,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white :Colors.black ,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr :mainColor ,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ?  Colors.white:Colors.black ,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkClr :mainColor ,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white :Colors.black ,
                  ),
                  label: "",
                ),
              ],
            ),
            body: IndexedStack(
              index: mainController.currentIndex.value,
              children: mainController.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
