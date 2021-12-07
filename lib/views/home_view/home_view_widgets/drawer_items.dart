import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/utils/open_url.dart';
import 'package:butex_notebot/views/settings_view/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'drawer_list_tile.dart';

final user = FirebaseAuth.instance.currentUser;

final List<Widget> drawerItems = [
  DrawerHeader(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello,",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          user!.displayName ?? "Butexian",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ],
    ),
  ),
  drawerListTile(
    onTap: () {
      UrlLauncher.openUrl(url: "https://notebot.netlify.app/#/");
    },
    leading: Icon(Icons.web),
    title: 'Notebot Web',
  ),
  drawerListTile(
    onTap: () {
      UrlLauncher.openUrl(url: "https://www.messenger.com/t/103148557940299");
    },
    leading: Image.asset(
      messengerImage,
      height: 25,
      width: 25,
    ),
    title: 'Notebot Messenger',
  ),
  drawerListTile(
    onTap: () {},
    leading: Icon(Icons.people_alt_sharp),
    title: 'Communities',
  ),
  drawerListTile(
    onTap: () {
      UrlLauncher.openUrl(
          url: "https://triptoafsin.github.io/BUTEX-PhoneBook/");
    },
    leading: Icon(
      Icons.phone,
      color: Colors.green,
    ),
    title: 'BUTEX Phonebook',
  ),
  drawerListTile(
    onTap: () {
      UrlLauncher.openUrl(url: "https://forms.gle/xRgr7HhS9Zycsvqn6");
    },
    leading: Icon(Icons.book),
    title: 'Submit Notes',
  ),
  drawerListTile(
    onTap: () {
      Get.to(() => SettingsView());
    },
    leading: Icon(Icons.settings),
    title: 'Settings',
  ),
  drawerListTile(
    onTap: () {
      authController.logout();
    },
    leading: Icon(Icons.close),
    title: 'Log Out',
  ),
];
