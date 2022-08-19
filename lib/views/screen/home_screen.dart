// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/HomePage/card_item.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/HomePage/searchformtext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? darkGreyClr : mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                          text: "Find Your",
                          fontSize: 25,
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                          underline: TextDecoration.none),
                      SizedBox(
                        height: 5,
                      ),
                      TextUtils(
                          text: "INSPIRATION",
                          fontSize: 28,
                          fontweight: FontWeight.bold,
                          color: Colors.white,
                          underline: TextDecoration.none),
                      SizedBox(
                        height: 20,
                      ),
                      SearchFormText(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextUtils(
                      text: "Categories",
                      fontSize: 20,
                      fontweight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underline: TextDecoration.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CardItem(),
            ],
          )),
    );
  }
}
