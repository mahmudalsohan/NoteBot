import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/coummunities/communities_section.dart';
import 'package:butex_notebot/views/settings_view/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'drawer_list_tile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            accountEmail: Text(user!.email ?? ""),
            accountName: Text(user.displayName ?? ""),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL ?? ""),
              backgroundColor: Colors.green,
            ),
            currentAccountPictureSize: Size.square(72),
            otherAccountsPictures: [Image.asset(logoNotebot)],
            otherAccountsPicturesSize: Size.square(50),
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                url: "https://notebot.netlify.app/#/",
                context: context,
              );
            },
            leading: Icon(Icons.language_outlined),
            title: 'Notebot Web',
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                url: "https://www.messenger.com/t/103148557940299",
                context: context,
              );
            },
            leading: Image.asset(
              iconMessenger,
              height: 25,
              width: 25,
            ),
            title: 'Notebot Messenger',
          ),
          drawerListTile(
            onTap: () {
              Get.to(() => CommunitiesHomeView());
            },
            leading: Icon(Icons.people_alt_sharp),
            title: 'Communities',
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                url: "https://triptoafsin.github.io/BUTEX-PhoneBook/",
                webView: true,
                context: context,
              );
            },
            leading: Icon(
              Icons.phone,
              color: Colors.green,
            ),
            title: 'BUTEX Phonebook',
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                url: "https://forms.gle/xRgr7HhS9Zycsvqn6",
                context: context,
              );
            },
            leading: Icon(Icons.book_outlined),
            title: 'Submit Notes',
          ),
          drawerListTile(
            onTap: () {
              Get.to(() => SettingsView());
            },
            leading: Icon(Icons.settings),
            title: 'Settings',
          ),
          Obx(
            () => drawerListTile(
              onTap: () {
                authController.logout();
              },
              leading: authController.isLoading.value
                  ? CircularProgressIndicator()
                  : Icon(Icons.logout_outlined),
              title: 'Log Out',
            ),
          )
        ],
      ),
    );
  }
}
