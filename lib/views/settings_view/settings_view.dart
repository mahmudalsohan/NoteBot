import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Settings"),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                title: Text("Change Theme"),
                trailing: ThemeSwitcher(
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
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
