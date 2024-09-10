import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonRounded extends StatelessWidget {
  final double? width;
  final Color color;
  final BorderRadiusGeometry? radius;
  final String text;
  final Color textColor;
  final double textSize;
  final String fontFamily;
  final Function onClick;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  const ButtonRounded(
      {super.key,
      this.width,
      this.color = const Color(0xFF007AFF),
      this.radius,
      required this.text,
      this.textColor = Colors.white,
      this.textSize = 14,
      required this.onClick,
      this.fontFamily = 'HelveticaNeue',
      this.fontWeight,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        width: width ?? Get.width,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: radius ?? BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontFamily: fontFamily,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
