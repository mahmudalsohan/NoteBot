import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ErrorScreen extends StatelessWidget {
  final String errMsg;
  const ErrorScreen({Key? key, required this.errMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.grey,
            size: 50,
          ),
          Text(errMsg),
        ],
      ),
    );
  }
}
