// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_using_getx/logic/controllers/auth_controller.dart';
import 'package:ecommerce_using_getx/routes/routes.dart';
import 'package:ecommerce_using_getx/utils/my_string.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/Check_widget.dart';
import 'package:ecommerce_using_getx/views/widget/auth/auth_button.dart';
import 'package:ecommerce_using_getx/views/widget/auth/auth_text_from_field.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/container_under.dart';

class SignupScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? Colors.white : context.theme.backgroundColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? darkGreyClr
                  : Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 60),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                text: "SIGN",
                                fontSize: 30,
                                fontweight: FontWeight.w600,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                underline: TextDecoration.none,
                              ),
                              TextUtils(
                                text: " UP",
                                fontSize: 30,
                                fontweight: FontWeight.w600,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underline: TextDecoration.none,
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          AuthTextFromField(
                            controller: nameController,
                            obscureText: false,
                            validator: (value) {
                              if (value.toString().length <= 2 ||
                                  !RegExp(validationName).hasMatch(value)) {
                                return "Enter valid Name";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : Image.asset("assets/images/user.png"),
                            suffixIcon: Text(""),
                            hintText: "User Name",
                          ),
                          SizedBox(height: 20),
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
                                ? Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : Image.asset("assets/images/email.png"),
                            suffixIcon: Text(""),
                            hintText: "Email",
                          ),
                          SizedBox(height: 20),
                          GetBuilder<AuthController>(builder: (controller) {
                            return AuthTextFromField(
                              controller: passController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return "Password should be longer";
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    )
                                  : Image.asset("assets/images/lock.png"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                        size: 25,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                              ),
                              hintText: "Password",
                            );
                          }),
                          SizedBox(height: 30),
                          CheckWidget(),
                          SizedBox(height: 30),
                          GetBuilder<AuthController>(builder: (controller) {
                            return AuthButton(
                              onPressed: () {
                                if (controller.isCheckbox == false) {
                                  Get.snackbar(
                                    "Check box",
                                    "Pleaase, Accept terms & conditions",
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                } else if (fromKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passController.text;
                                  controller.signUpUsingFirebase(
                                      name: name,
                                      email: email,
                                      password: password);
                                }
                                controller.isCheckbox == true;
                              },
                              text: 'SIGN UP',
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextUtils(
                                  text: "Already have an Account? ",
                                  fontSize: 20,
                                  fontweight: FontWeight.bold,
                                  color: kCOlor1,
                                  underline: TextDecoration.none),
                              TextButton(
                                  onPressed: () {
                                    Get.offNamed(Routes.loginScreen);
                                  },
                                  child: TextUtils(
                                      text: "LogIn",
                                      fontSize: 20,
                                      fontweight: FontWeight.bold,
                                      color:
                                          Get.isDarkMode ? pinkClr : mainColor,
                                      underline: TextDecoration.underline))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
