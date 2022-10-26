import 'package:ecommerce_using_getx/logic/controllers/cart_controller.dart';
import 'package:ecommerce_using_getx/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class AddCart extends StatelessWidget {
  AddCart({
    required this.price,
    required this.productModels,
    Key? key,
  }) : super(key: key);
  double price;
  final controller = Get.find<CartController>();
  ProductModels productModels;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              const TextUtils(
                text: "Price",
                fontSize: 16,
                fontweight: FontWeight.bold,
                color: Colors.grey,
                underline: TextDecoration.none,
              ),
              Text(
                "\$ $price",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    height: 1.5),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor),
                  onPressed: () {
                    controller.addProductTocart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextUtils(
                        text: "Add To Cart",
                        fontSize: 22,
                        fontweight: FontWeight.bold,
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
