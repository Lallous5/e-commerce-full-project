import 'package:ecommerce_using_getx/logic/controllers/cart_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/cart_product.dart';
import '../widget/cart/cart_total.dart';
import '../widget/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProduct();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              )),
          child: Obx(
            () {
              if (controller.productsMap.isEmpty) {
                return const EmptyCart();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                quantity: controller.productsMap.values
                                    .toList()[index],
                                index: index,
                                pr: controller.productsMap.keys.toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: controller.productsMap.length),
                      ),
                      CartTotal()
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
