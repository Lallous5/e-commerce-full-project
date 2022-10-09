import 'package:ecommerce_using_getx/models/product_model.dart';
import 'package:ecommerce_using_getx/routes/routes.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductTocart(ProductModels pr) {
    if (productsMap.containsKey(pr)) {
      productsMap[pr] += 1;
    } else {
      productsMap[pr] = 1;
    }
    Get.snackbar(
      " addProductTocart!!",
      "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void removeProductsFarmCart(ProductModels pr) {
    if (productsMap.containsKey(pr) && productsMap[pr] == 1) {
      productsMap.removeWhere((key, value) => key == pr);
    } else {
      productsMap[pr] -= 1;
    }
    Get.snackbar(
      "removeProducts!!",
      "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void removeOnePrduct(ProductModels pr) {
    productsMap.removeWhere((key, value) => key == pr);
  }

  void clearAllProduct() {
    Get.defaultDialog(
        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
        title: "Clear Product",
        middleText: "Are you sure you need to Clear Product",
        middleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        radius: 10,
        backgroundColor: Colors.grey,
        textCancel: "NOO",
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        textConfirm: "YESS",
        onConfirm: () {
          productsMap.clear();
          Get.back();
        },
        onCancel: () {
          Get.toNamed(Routes.cartScreen);
        });
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
