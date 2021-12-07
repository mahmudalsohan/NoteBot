import 'package:flutter/material.dart';

customSnackBar(
  BuildContext context, {
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
    ),
  );
}
