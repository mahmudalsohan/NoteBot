import 'package:flutter/material.dart';

Widget contentListTile({
  required String title,
  required BuildContext context,
  String? route,
  Widget? trailer,
  Widget? leading,
  required Function onTap,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Card(
      elevation: 2,
      child: ListTile(
        onTap: () => onTap(),
        trailing: trailer,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              title,
              //textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );
}
