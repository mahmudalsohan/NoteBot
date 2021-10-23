import 'package:flutter/material.dart';

import 'change_theme_button_widget.dart';

PreferredSizeWidget customAppBar(bool isDarkTheme) {
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkTheme ? Colors.blueGrey : Color(0xffce93d8),
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
