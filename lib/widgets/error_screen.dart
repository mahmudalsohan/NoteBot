import 'package:butex_notebot/constants/asset_path.dart';
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
          Image(
            image: AssetImage(iconWarning),
            height: 150,
            width: 150,
          ),
          Text(errMsg),
        ],
      ),
    );
  }
}
