import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/coummunities/communities_section.dart';
import 'package:butex_notebot/views/settings/settings_view.dart';
import 'package:butex_notebot/widgets/webview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              backgroundColor: Colors.grey,
            ),
            currentAccountPictureSize: Size.square(72),
            otherAccountsPictures: [Image.asset(logoNotebot)],
            otherAccountsPicturesSize: Size.square(50),
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                url: "https://forms.gle/iwMSHxjg8doKRQ9T6",
                context: context,
              );
            },
            leading: Icon(
              Icons.rate_review_outlined,
            ),
            title: 'Send Feedback',
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                url: "https://notebot.netlify.app/#/",
                context: context,
              );
            },
            leading: Icon(
              Icons.language_outlined,
            ),
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
              color:
                  themeController.isDarkMode.value ? Colors.white : Colors.grey,
              height: 20,
              width: 20,
            ),
            title: 'Notebot Messenger',
          ),
          drawerListTile(
            onTap: () {
              Get.to(() => CommunitiesHomeView());
            },
            leading: Icon(
              Icons.people_alt_sharp,
            ),
            title: 'Communities',
          ),
          drawerListTile(
            onTap: () {
              if (appController.inAppWebView.value) {
                Get.to(
                  () => OpenWebView(
                    title: "BUTEX PhoneBook",
                    url: "https://triptoafsin.github.io/BUTEX-PhoneBook/",
                  ),
                );
              } else {
                UrlLauncher.openUrl(
                  url: "https://triptoafsin.github.io/BUTEX-PhoneBook/",
                  context: context,
                );
              }
            },
            leading: Icon(
              Icons.phone,
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
            leading: Icon(
              Icons.book_outlined,
            ),
            title: 'Submit Notes',
          ),
          drawerListTile(
            onTap: () {
              Get.to(() => SettingsView());
            },
            leading: Icon(
              Icons.settings,
            ),
            title: 'Settings',
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                  url:
                      "https://www.facebook.com/sharer/sharer.php?u=https://play.google.com/store/apps/details?id=com.hawkers.notebot",
                  context: context);
            },
            leading: Image.asset(
              iconFacebook,
              color:
                  themeController.isDarkMode.value ? Colors.white : Colors.grey,
              height: 20,
              width: 20,
            ),
            title: 'Share App on Facebook',
          ),
          drawerListTile(
            onTap: () {
              UrlLauncher.openUrl(
                  url:
                      "https://play.google.com/store/apps/details?id=com.hawkers.notebot",
                  context: context);
            },
            leading: Icon(
              Icons.star,
            ),
            title: 'Rate this App',
          ),
          drawerListTile(
            onTap: () {
              Get.to(
                () => OpenWebView(
                  title: "Privacy Policy",
                  url:
                      "https://docs.google.com/document/d/15HneadNPSAna0IIxxdfYeufG-WUGKpUjfbBGkFhUjKc/edit?fbclid=IwAR09ZE4xrwdJd4zs6bkWOu7BinvaTUrabNTwjZKXgqddkDDSx8TDzhgpyKg",
                ),
              );
            },
            leading: Icon(
              Icons.privacy_tip_outlined,
            ),
            title: 'Privacy Policy',
          ),
          Obx(
            () => drawerListTile(
              onTap: () {
                authController.logout();
              },
              leading: authController.isLoading.value
                  ? CircularProgressIndicator()
                  : Icon(
                      Icons.logout_outlined,
                    ),
              title: 'Log Out',
            ),
          )
        ],
      ),
    );
  }
}
