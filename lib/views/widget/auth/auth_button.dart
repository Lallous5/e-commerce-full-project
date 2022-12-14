import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
          text: text,
          fontSize: 20,
          fontweight: FontWeight.bold,
          color: Colors.white,
          underline: TextDecoration.none),
    );
  }
}
