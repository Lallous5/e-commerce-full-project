import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontweight;
  final Color color;
  final TextDecoration underline;
  TextUtils(
      {required this.text,
      required this.fontSize,
      required this.fontweight,
      required this.color,
      required this.underline,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontweight,
            decoration: underline,
          ),
        ));
  }
}
