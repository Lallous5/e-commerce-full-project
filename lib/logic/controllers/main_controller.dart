import 'package:ecommerce_using_getx/views/screen/category_screen.dart';
import 'package:ecommerce_using_getx/views/screen/favorite_screen.dart';
import 'package:ecommerce_using_getx/views/screen/home_screen.dart';
import 'package:ecommerce_using_getx/views/screen/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs =
      [const HomeScreen(), const CategoryScreen(), FavoriteScreen(), const SettingScreen()].obs;

  final title = [
    "LALLOUS SHOP",
    "Categories",
    "Favorites",
    "Settings",
  ];
}
