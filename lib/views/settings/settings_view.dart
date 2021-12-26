import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
                title: Text("Theme"),
                trailing: Obx(() => DropdownButton(
                      value: themeController.isDarkMode.value,
                      items: themeController.darkModeState.map((bool state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state ? "Dark" : "Light"),
                        );
                      }).toList(),
                      onChanged: (newState) {
                        themeController.changeTheme();
                      },
                    )),
              ),
              Divider(),
              ListTile(
                title: Text("Open Links Internally"),
                trailing: Obx(
                  () => Switch.adaptive(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: appController.inAppWebView.value,
                    onChanged: (val) {
                      appController.switchInAppWebView();
                    },
                  ),
                ),
              ),
              Divider(),
              Obx(
                () => ListTile(
                  title: Text("Grid Layout"),
                  trailing: DropdownButton(
                      value: homeViewController.selectedGrid.value,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: homeViewController.gridLayout.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        homeViewController.selectedGrid.value = newValue!;
                        homeViewController.updateGrid();
                      }),
                ),
              ),
              //GridToggleContainer(),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
