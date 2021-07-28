import 'package:flutter/material.dart';

import 'change_theme_button_widget.dart';

PreferredSizeWidget appBar(bool isDarkTheme) {
  return AppBar(
    backgroundColor: isDarkTheme ? Colors.blueGrey : Colors.blue,
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
