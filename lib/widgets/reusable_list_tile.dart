import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableListTile({
  required String title,
  required BuildContext context,
  Widget? trailer,
  Widget? leading,
  Widget? subTitle,
  required Function onTap,
}) {
  return Column(
    children: [
      ListTile(
        subtitle: subTitle,
        onTap: () => onTap(),
        trailing: trailer,
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      Divider(
        color: themeController.isDarkMode.value ? Colors.white : Colors.grey,
      ),
    ],
  );
}
