import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/material.dart';

Widget contentListTile({
  required String title,
  required BuildContext context,
  String? route,
  Widget? trailer,
  Widget? leading,
  required Function onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Card(
      elevation: 2,
      color: themeController.isDarkMode.value
          ? Color(0xff1a2d3d)
          : Theme.of(context).colorScheme.background,
      child: ListTile(
        onTap: () => onTap(),
        trailing: trailer,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );
}
