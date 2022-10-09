// ignore_for_file: file_names

import 'package:ecommerce_using_getx/logic/controllers/auth_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.checkbox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckbox
                  ? Get.isDarkMode
                      ? const Icon(
                          Icons.done,
                          color: pinkClr,
                          size: 30,
                        )
                      : Image.asset("assets/images/check.png")
                  : Container(),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              TextUtils(
                text: "I accept",
                fontSize: 18,
                fontweight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(width: 10),
              TextUtils(
                  text: "term & conditions",
                  fontSize: 18,
                  fontweight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.underline),
            ],
          )
        ],
      );
    });
  }
}
