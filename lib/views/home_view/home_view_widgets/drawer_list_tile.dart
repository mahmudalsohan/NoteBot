import 'package:flutter/material.dart';

Widget drawerListTile({
  required String title,
  required Function onTap,
  Widget? leading,
  Widget? trailing,
}) {
  return Column(
    children: [
      ListTile(
        onTap: () => onTap(),
        leading: leading,
        trailing: trailing,
        title: Text(title),
      ),
      Divider(),
    ],
  );
}
