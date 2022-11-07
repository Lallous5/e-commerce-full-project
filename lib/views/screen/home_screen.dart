// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/screen/product_details_screen.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../../logic/controllers/product_controller.dart';
import '../../models/product_model.dart';
import '../widget/HomePage/searchformtext.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put<ProductController>(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.25,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? darkGreyClr : mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      TextUtils(
                                          text: "Find Your",
                                          fontSize: 25,
                                          fontweight: FontWeight.bold,
                                          color: Colors.white,
                                          underline: TextDecoration.none),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextUtils(
                                          text: "INSPIRATION",
                                          fontSize: 28,
                                          fontweight: FontWeight.bold,
                                          color: Colors.white,
                                          underline: TextDecoration.none),
                                    ],
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
                                      scale: 1,
                                      height: 55,
                                      width: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SearchFormText(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  listofitems("TRENDING PRODUCTS", () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                      );
                    } else {
                      return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return CardListItem(
                                imgURL: controller.productList[index].image,
                                price: controller.productList[index].price,
                                rate: controller.productList[index].rating.rate,
                                productId: controller.productList[index].id,
                                pr: controller.productList[index],
                                onTap: () {
                                  Get.to(() => ProductDetailsScreen(
                                        productModels:
                                            controller.productList[index],
                                      ));
                                },
                              );
                            },
                          ));
                    }
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  listofitems("POPULAR PRODUCTS", () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                      );
                    } else {
                      return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              var list =
                                  controller.productList.reversed.toList();
                              var listpr =
                                  controller.productList.reversed.toList();
                              return CardListItem(
                                imgURL: list[index].image,
                                price: list[index].price,
                                rate: list[index].rating.rate,
                                productId: list[index].id,
                                pr: listpr[index],
                                onTap: () {
                                  Get.to(() => ProductDetailsScreen(
                                        productModels: list[index],
                                      ));
                                },
                              );
                            },
                          ));
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Row listofitems(String title, Function onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: title,
                fontSize: 18,
                fontweight: FontWeight.bold,
                color: Colors.black,
                underline: TextDecoration.none),
          ),
        ),
        const Expanded(
            child: Divider(
          indent: 5,
          endIndent: 5,
          thickness: 2,
          color: Colors.grey,
        )),
        InkWell(
          onTap: onTap(),
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                  text: "See More",
                  fontSize: 16,
                  fontweight: FontWeight.bold,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  underline: TextDecoration.none),
            ),
          ),
        ),
      ],
    );
  }
}

class CardListItem extends StatelessWidget {
  CardListItem({
    Key? key,
    required this.imgURL,
    required this.price,
    required this.rate,
    required this.productId,
    required this.pr,
    required this.onTap,
  }) : super(key: key);
  final String imgURL;
  final double price;
  final double rate;
  final int productId;
  final ProductModels pr;
  final Function() onTap;
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 180,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    blurStyle: BlurStyle.inner)
              ]),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFav(productId);
                      },
                      icon: controller.isFav(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                    ),
                    IconButton(
                        onPressed: () {
                          cartController.addProductTocart(pr);
                        },
                        icon: Image.asset(
                          "assets/images/card.png",
                          height: 25,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  imgURL,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                text: "$rate",
                                fontSize: 13,
                                fontweight: FontWeight.bold,
                                color: Colors.white,
                                underline: TextDecoration.none),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
