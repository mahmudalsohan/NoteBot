import 'package:butex_notebot/models/shortcut_chip.dart';
import 'package:butex_notebot/models/shortcut_chip_list.dart';
import 'package:butex_notebot/views/academic_views/topics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ChipsContainer extends StatefulWidget {
  const ChipsContainer({Key? key}) : super(key: key);

  @override
  _ChipsContainerState createState() => _ChipsContainerState();
}

class _ChipsContainerState extends State<ChipsContainer> {
  List<ShortcutChip> shortcutChips = ShortcutChipList.all;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: shortcutChips
          .map(
            (shortcutChip) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: InputChip(
                label: Text(shortcutChip.subName),
                onPressed: () => Get.to(
                  () => TopicsScreen(
                    subjectRoute: shortcutChip.route,
                    subjectName: shortcutChip.subName,
                  ),
                ),
                onDeleted: () => setState(() {
                  shortcutChips.remove(shortcutChip);
                }),
              ),
            ),
          )
          .toList(),
    );
  }
}
