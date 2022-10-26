import 'package:ecommerce_using_getx/logic/controllers/product_controller.dart';
import 'package:ecommerce_using_getx/views/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class ClothesInfo extends StatefulWidget {
  ClothesInfo({
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
    Key? key,
  }) : super(key: key);
  final String title;
  final int productId;
  final double rate;
  final String description;

  @override
  State<ClothesInfo> createState() => _ClothesInfoState();
}

class _ClothesInfoState extends State<ClothesInfo> {
  final controller = Get.find<ProductController>();
  bool isShowMore = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextUtils(
                    text: widget.title,
                    fontSize: 20,
                    fontweight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none),
              ),
              Obx(
                () => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.manageFav(widget.productId);
                      },
                      child: controller.isFav(widget.productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 25,
                            ),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: widget.rate.toString(),
                fontSize: 17,
                fontweight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              RatingBarIndicator(
                rating: widget.rate,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 25.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Details: ",
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.description,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? "Show More..." : "Show Less...",
                style: TextStyle(
                    fontSize: 16,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
