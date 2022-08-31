// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce_using_getx/models/product_model.dart';
import 'package:ecommerce_using_getx/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storageShopping = storage.read<List>("isFavList");
    if (storageShopping != null) {
      favList =
          storageShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading.value = true;
      if (products != null && products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }

//logic for fav screen

  void manageFav(int productId) async {
    var existingIndex =
        favList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favList.removeAt(existingIndex);
      await storage.remove("isFavList");
    } else {
      favList.add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavList", favList);
    }
  }

  bool isFav(int productId) {
    return favList.any((element) => element.id == productId);
  }
}
