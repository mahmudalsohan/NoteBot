import 'package:butex_notebot/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'chips_container.dart';

class PinSection extends StatelessWidget {
  const PinSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            //color: Colors.blueAccent,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📌 Pinned",
              style: AppTextStyles().kHomeViewTitleTextStyle,
            ),
            SizedBox(height: 15),
            ChipsContainer(),
          ],
        ),
      ),
    );
  }
}
