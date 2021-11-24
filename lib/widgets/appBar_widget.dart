import 'package:butex_notebot/models/menu_item.dart';
import 'package:butex_notebot/models/menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_theme_button_widget.dart';

PreferredSizeWidget customAppBar(
    {required BuildContext context, required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    actions: [
      ChangeThemeButton(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(Icons.refresh),
      ),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.asset(
            "assets/images/messenger.png",
            height: 20,
            width: 20,
          ),
        ),
      ),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.phone,
            color: Colors.greenAccent,
          ),
        ),
      ),
      PopupMenuButton<MenuItem>(
        itemBuilder: (context) =>
            MenuItems.menuItemsList.map(buildItem).toList(),
      )
    ],
  );
}

PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
      child: Text(item.text),
    );
