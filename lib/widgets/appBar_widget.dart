import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // actions: [
    //   ThemeSwitcher(
    //     builder: (context) => Obx(
    //       () => InkWell(
    //         onTap: () {
    //           themeController.changeTheme(context);
    //         },
    //         child: themeController.isDarkMode.value
    //             ? Icon(
    //                 CupertinoIcons.brightness,
    //                 color: AppColors().kThemeIconColor,
    //               )
    //             : Icon(
    //                 CupertinoIcons.moon_stars,
    //                 color: AppColors().kThemeIconColor,
    //               ),
    //       ),
    //     ),
    //   ),
    //   /*PopupMenuButton<MenuItem>(
    //     itemBuilder: (context) =>
    //         MenuItems.menuItemsList.map(buildItem).toList(),
    //   )*/
    // ],
  );
}

/*
PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
      onTap: () {
        item.onTap();
      },
      child: Text(item.text),
    );
*/
