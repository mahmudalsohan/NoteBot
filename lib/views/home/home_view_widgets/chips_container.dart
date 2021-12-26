import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/views/notes/topic/notes_topics_view.dart';
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
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        final String route = GetStorage().read(chipTitle);
                        Get.to(
                          () => TopicsView(
                            subjectRoute: route,
                            subjectName: chipTitle,
                          ),
                        );
                      },
                      onLongPress: () {
                        _showDialog(chipTitle);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode.value
                              ? Color(0xff1a2d3d)
                              : Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(6.0, 8.0),
                              blurRadius: 2,
                              spreadRadius: 0.001,
                              color: AppColors().kFunctionTileShadowColor,
                            ),
                          ],
                          /*boxShadow: [
                            BoxShadow(
                              //offset: Offset(8.0, 8.0),
                              blurRadius: 15,
                              spreadRadius: 5,
                              color: Colors.black12,
                            ),
                          ],*/
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Text(
                            chipTitle,
                            style: AppTextStyles().kShortcutChipTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
            : [
                Center(
                  child: Text(
                    "No Pinned Subject☹\n\nSwipe Right to Pin any Subject here\nTap and Hold to remove",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
      ),
    );
  }

  _showDialog(chipTitle) {
    return Get.defaultDialog(
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
  }
}
