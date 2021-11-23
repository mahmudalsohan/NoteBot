import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();

  late final GetStorage _getStorage;
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    _getStorage = GetStorage();

    isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
  }

  void changeTheme(BuildContext context) {
    final theme =
        Get.isDarkMode ? AppThemes.lightThemeData : AppThemes.darkThemeData;
    ThemeSwitcher.of(context)!.changeTheme(theme: theme);
    if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
      isDarkMode.value = false;
    } else {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
      isDarkMode.value = true;
    }
  }
}
