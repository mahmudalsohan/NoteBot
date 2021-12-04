import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/views/academic_views/topics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';

class ChipsContainer extends StatelessWidget {
  const ChipsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children: homeViewController.chipTitles.length != 0
            ? homeViewController.chipTitles
                .map(
                  (chipTitle) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: InkWell(
                      onTap: () {
                        final String route = GetStorage().read(chipTitle);
                        Get.to(
                          () => TopicsScreen(
                            subjectRoute: route,
                            subjectName: chipTitle,
                          ),
                        );
                      },
                      onLongPress: () {
                        Get.defaultDialog(
                          title: "WARNING!!!",
                          titleStyle: TextStyle(),
                          middleText: "Remove $chipTitle from shortcut?",
                          confirm: TextButton(
                            onPressed: () {
                              Get.back();
                              homeViewController.chipTitles.remove(chipTitle);
                              GetStorage().remove(chipTitle);
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          cancel: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Don't Remove"),
                          ),
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
                          child: Text(chipTitle),
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
            : [
                Text(
                  "You have no Pinned Subjects",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
      ),
    );
  }
}
