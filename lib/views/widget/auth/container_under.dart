// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Get.isDarkMode ?  pinkClr:mainColor ,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child:
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontweight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  text: textType,
                  fontSize: 20,
                  fontweight: FontWeight.bold,
                  color: Colors.white,
                  underline: TextDecoration.underline))
        ],
      ),
  
    );
  }
}
