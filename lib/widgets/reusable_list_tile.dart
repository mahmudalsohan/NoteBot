import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableListTile({
  required String title,
  required BuildContext context,
  String? route,
  Widget? trailer,
  Widget? leading,
  required Function onTap,
}) {
  return Column(
    children: [
      ListTile(
        onTap: () => onTap(),
        trailing: trailer,
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      Divider(color: Colors.white),
    ],
  );
}
