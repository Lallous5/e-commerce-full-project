import 'package:ecommerce_using_getx/utils/theme.dart';
import 'package:ecommerce_using_getx/views/widget/profile/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            height: 580,
            child: SingleChildScrollView(
              child: Column(
                children: [
                 const Info(),
                  ProfileMenuItem(
                    icon: Icon(
                      Icons.favorite,
                      size: 33,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    press: () {},
                    title: 'Favorite',
                  ),
                  ProfileMenuItem(
                    icon: Icon(
                      Icons.paypal,
                      size: 33,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    press: () {},
                    title: 'PayPal',
                  ),
                  ProfileMenuItem(
                    icon: Icon(
                      Icons.language,
                      size: 33,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    press: () {},
                    title: 'Change Language',
                  ),
                  ProfileMenuItem(
                    icon: Icon(
                      Icons.help,
                      size: 33,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    press: () {},
                    title: 'Help',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem(
      {Key? key, required this.icon, required this.title, required this.press})
      : super(key: key);
  final Icon icon;
  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    var defaultsize = MediaQuery.of(context).size.height * 0.02;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultsize * 1.5, vertical: defaultsize / 1.9),
        child: Row(
          children: [
            icon,
            SizedBox(width: defaultsize * 2),
            Text(
              title,
              style: TextStyle(
                  fontSize: defaultsize * 1.3,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
                onPressed: press,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
