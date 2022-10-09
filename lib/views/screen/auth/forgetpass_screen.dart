import 'package:ecommerce_using_getx/logic/controllers/auth_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widget/auth/auth_text_from_field.dart';

class ForgotpassScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

   ForgotpassScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          title: Text(
            "Forgot Password",
            style: TextStyle(
                color: Get.isDarkMode ? mainColor : pinkClr, fontSize: 22),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "If you want recover your account ,then please provide your email Below ...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  ),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 300,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset("assets/images/email.png")
                        : const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          ),
                    suffixIcon: const Text(""),
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<AuthController>(builder: (controller) {
                    return AuthButton(
                      text: "SEND",
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          controller.resetPasswordUsingFirebase(
                              email: emailController.text.trim());
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
