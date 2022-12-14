import 'package:ecommerce_using_getx/logic/controllers/product_controller.dart';
import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/screen/product_details_screen.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Obx(() {
              if (controller.favList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/heart.png"),
                      ),
                      const SizedBox(height: 20),
                      TextUtils(
                          text: "Please, Add Your Favorites Products",
                          fontSize: 22,
                          fontweight: FontWeight.bold,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underline: TextDecoration.none),
                    ],
                  ),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return buildFavItems(
                        image: controller.favList[index].image,
                        title: controller.favList[index].title,
                        price: controller.favList[index].price,
                        productId: controller.favList[index].id,
                        ontap: () {
                          Get.to(() => ProductDetailsScreen(
                                productModels: controller.favList[index],
                              ));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: controller.favList.length);
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required String title,
    required double price,
    required int productId,
    required Function() ontap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: ontap,
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Row(
            children: [
              SizedBox(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    controller.manageFav(productId);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 32,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
