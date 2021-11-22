import 'package:flutter/material.dart';

Widget drawer() {
  final Color themeColor = Colors.white;
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text("Drawer Header"),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
          tileColor: themeColor,
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          tileColor: themeColor,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          tileColor: themeColor,
        ),
      ],
    ),
  );
}
