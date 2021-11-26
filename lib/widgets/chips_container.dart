import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/academic_views/topics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ChipsContainer extends StatelessWidget {
  const ChipsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Wrap(
          children: homeScreenController.allChips
              .map(
                (singleChip) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => TopicsScreen(
                          subjectRoute: singleChip.route,
                          subjectName: singleChip.subName,
                        ),
                      );
                    },
                    onLongPress: () {
                      Get.defaultDialog(
                        title: "WARNING!!!",
                        middleText:
                            "Remove ${singleChip.subName} from shortcut?",
                        textConfirm: "Remove",
                        onConfirm: () {
                          Get.back();
                          homeScreenController.allChips.remove(singleChip);
                        },
                        onCancel: () => Get.back(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(singleChip.subName),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
