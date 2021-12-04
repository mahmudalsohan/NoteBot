import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/models/shortcut_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';

Widget reusableListTile({
  bool isSlidable = false,
  required String title,
  String? route,
  Widget? trailer,
  Widget? leading,
  required Function onTap,
}) {
  Widget slidableListTile = Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            if (route != null) {
              if (homeViewController.chipTitles.length < 8) {
                GetStorage().write(title, route);
                homeViewController.chipTitles.add(title);
                homeViewController.updateChipsStorage();
              } else {
                Get.snackbar(
                  "Warning",
                  "You can add only 8 shortcut",
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            } else {
              Get.snackbar(
                "Warning",
                "Only Subjects can be added for Shortcut",
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          icon: Icons.push_pin,
          label: 'Pin',
        ),
      ],
    ),
    child: ListTile(
      onTap: () => onTap(),
      trailing: trailer,
      leading: leading,
      title: Center(
        child: Text(
          title,
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
                  title,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
      Divider(),
    ],
  );
}
