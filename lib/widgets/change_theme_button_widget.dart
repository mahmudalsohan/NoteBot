import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (context) => Obx(
        () => InkWell(
          onTap: () {
            themeController.changeTheme(context);
          },
          child: themeController.isDarkMode.value
              ? Icon(
                  CupertinoIcons.brightness,
                  color: AppColors().kThemeIconColor,
                )
              : Icon(
                  CupertinoIcons.moon_stars,
                  color: AppColors().kThemeIconColor,
                ),
        ),
      ),
    );
  }
}
