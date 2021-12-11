import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget aboutBanner({
  required Color bannerColor,
  required Color textColor,
  required String title,
}) {
  return Container(
    height: 40,
    width: Get.width * 0.45,
    decoration: BoxDecoration(
      color: bannerColor,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(40),
        topRight: Radius.circular(3),
      ),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      ),
    ),
  );
}
