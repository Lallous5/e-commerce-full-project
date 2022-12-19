import 'package:ecommerce_using_getx/views/widget/HomePage/card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CardItem(),
    );
  }
}
