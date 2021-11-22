import 'package:butex_notebot/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopContainer extends StatelessWidget {
  final String imagePath;
  final String? title;
  const TopContainer({
    Key? key,
    required this.imagePath,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.12,
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 15),
          title != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title!,
                    style: AppTextStyles().kTopContainerTextStyle,
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}
