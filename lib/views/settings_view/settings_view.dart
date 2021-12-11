import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/themes.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
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
                trailing: Obx(
                  () => InkWell(
                    onTap: () {
                      themeController.changeTheme();
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
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
