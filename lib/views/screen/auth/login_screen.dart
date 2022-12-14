// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_from_field.dart';
import '../../widget/auth/container_under.dart';
import '../../widget/text_utils.dart';

class LoginScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
                                text: "LOG",
                                fontSize: 30,
                                fontweight: FontWeight.w600,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                underline: TextDecoration.none,
                              ),
                              TextUtils(
                                text: " IN",
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
                          GetBuilder<AuthController>(
                            builder: (controller) {
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
                            },
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotpassScreen);
                              },
                              child: TextUtils(
                                  text: "Forgot Passwrd?",
                                  fontSize: 16,
                                  fontweight: FontWeight.normal,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  underline: TextDecoration.none),
                            ),
                          ),
                          SizedBox(height: 20),
                          GetBuilder<AuthController>(builder: (controller) {
                            return AuthButton(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passController.text;
                                  controller.logInUingFirebase(
                                      email: email, password: password);
                                }
                              },
                              text: 'LOGIN',
                            );
                          }),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextUtils(
                                  text: "Don't have an Account? ",
                                  fontSize: 20,
                                  fontweight: FontWeight.bold,
                                  color: kCOlor1,
                                  underline: TextDecoration.none),
                              TextButton(
                                  onPressed: () {
                                    Get.offNamed(Routes.signupScreen);
                                  },
                                  child: TextUtils(
                                      text: "SignUp",
                                      fontSize: 20,
                                      fontweight: FontWeight.bold,
                                      color:
                                          Get.isDarkMode ? pinkClr : mainColor,
                                      underline: TextDecoration.underline))
                            ],
                          ),
                          TextUtils(
                            text: "OR",
                            fontSize: 18,
                            fontweight: FontWeight.w600,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underline: TextDecoration.none,
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      "assets/images/facebook.png")),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {},
                                  child:
                                      Image.asset("assets/images/google.png")),
                            ],
                          )
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
