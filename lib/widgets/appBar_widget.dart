import 'package:flutter/material.dart';
import 'change_theme_button_widget.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(
      "NoteBot",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    actions: [
      //toggle button to change theme
      ChangeThemeButton(),
    ],
  );
}
