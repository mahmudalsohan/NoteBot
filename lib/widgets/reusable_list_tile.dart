import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableListTile({
  String? leadingImage,
  required String titleName,
  Widget? trailer,
  required Function onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          onTap();
        },
        leading: leadingImage != null
            ? Container(
                height: 40,
                width: 40,
                child: Image.asset(leadingImage),
              )
            : null,
        trailing: trailer,
        title: Center(
          child: Text(
            titleName,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    ),
  );
}
