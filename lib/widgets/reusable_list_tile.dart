import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/shortcut_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget reusableListTile({
  bool isSlidable = false,
  required String titleName,
  String? route,
  Widget? trailer,
  required Function onTap,
}) {
  Widget slidableListTile = Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            if (route != null) {
              if (homeScreenController.allChips.length < 4) {
                homeScreenController.allChips.add(
                  ShortcutChip(subName: titleName, route: route),
                );
              } else {
                Get.snackbar(
                  "Warning",
                  "You can add only 8 shortcut",
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            }
          },
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          icon: Icons.push_pin,
          label: 'Pin',
        ),
      ],
    ),
    child: ListTile(
      onTap: () => onTap(),
      trailing: trailer,
      title: Center(
        child: Text(
          titleName,
          style: TextStyle(fontSize: 25),
        ),
      ),
    ),
  );
  return Column(
    children: [
      isSlidable
          ? slidableListTile
          : ListTile(
              onTap: () => onTap(),
              trailing: trailer,
              title: Center(
                child: Text(
                  titleName,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
      Divider(),
    ],
  );
}
