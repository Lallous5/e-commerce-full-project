import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  List<String> size = ['S', 'M', 'L', 'XL', 'XXL'];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? currentSelected == index
                            ? pinkClr
                            : pinkClr.withOpacity(0.4)
                        : currentSelected == index
                            ? mainColor
                            : mainColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Text(
                  size[index],
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemCount: size.length),
    );
  }
}
