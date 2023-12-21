import 'package:flutter/material.dart';

abstract class AppStyle {
  static final buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(const Color(0xFF3A59A8)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),),
    textStyle: const MaterialStatePropertyAll(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      )
    )
  );

  static const titleGreyText = TextStyle(
    color: greyColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const smallGreyText = TextStyle(
    color: greyColor,
    fontSize: 12,
    fontWeight: FontWeight.w500
  );

  static const titleBlackText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600
  );

  static const backgroundColor = Color(0xFFF5F5F5);

  static const greyColor = Color(0xFFBABABA);
}