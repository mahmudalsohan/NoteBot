import 'package:flutter/material.dart';

customSnackBar(
  BuildContext context, {
  Color bg = Colors.blueGrey,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1000),
      backgroundColor: bg,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
