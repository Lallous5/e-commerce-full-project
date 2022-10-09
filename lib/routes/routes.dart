import 'package:ecommerce_using_getx/logic/binding/auth_binding.dart';
import 'package:ecommerce_using_getx/logic/binding/main_binding.dart';
import 'package:ecommerce_using_getx/logic/binding/product_binding.dart';
import 'package:ecommerce_using_getx/views/screen/auth/forgetpass_screen.dart';
import 'package:ecommerce_using_getx/views/screen/auth/login_screen.dart';
import 'package:ecommerce_using_getx/views/screen/cart_screen.dart';
import 'package:ecommerce_using_getx/views/screen/main_screen.dart';
import 'package:ecommerce_using_getx/views/screen/welcome_screen.dart';
import 'package:get/get.dart';

import '../views/screen/auth/signup_screen.dart';

class AppRoutes {
  //initialRoutes
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPage

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signupScreen,
        page: () => SignupScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotpassScreen,
        page: () => ForgotpassScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgotpassScreen = '/forgotpassScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartSreen';
}
