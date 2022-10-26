import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  ColorPicker({required this.color, required this.outerBorder, Key? key})
      : super(key: key);
  final bool outerBorder;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder ? Border.all(color: color, width: 3) : null,
      ),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          )),
    );
  }
}
