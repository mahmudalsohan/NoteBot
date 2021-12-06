import 'package:butex_notebot/constants/text_styles.dart';
import 'package:flutter/material.dart';

Widget levelSelectionTile({
  required String title,
  required Function onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2.0,
            color: Colors.blueAccent,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles().kSelectLevelButtonTextStyle,
          ),
        ),
      ),
    ),
  );
}
