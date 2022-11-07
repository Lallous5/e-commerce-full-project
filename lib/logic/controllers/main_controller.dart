
import 'package:ecommerce_using_getx/views/screen/favorite_screen.dart';
import 'package:ecommerce_using_getx/views/screen/home_screen.dart';
import 'package:ecommerce_using_getx/views/screen/profile_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 1.obs;

  final tabs =
      [ FavoriteScreen() ,HomeScreen() , const ProfileScreen()].obs;

  final title = [
    "Favorites",
    "LALLOUS SHOP",
    "Profile",
  ];
}
