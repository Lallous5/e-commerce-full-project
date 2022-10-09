import 'package:ecommerce_using_getx/logic/controllers/cart_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                children: [
                  const TextUtils(
                    text: "Total",
                    fontSize: 16,
                    fontweight: FontWeight.bold,
                    color: Colors.grey,
                    underline: TextDecoration.none,
                  ),
                  Text(
                    "\$ ${controller.total}",
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextUtils(
                            text: "CheckOut",
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
        ));
  }
}
