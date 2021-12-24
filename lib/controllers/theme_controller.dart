import 'dart:ui';

import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();

  late final GetStorage _getStorage;
  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));*/

    _getStorage = GetStorage();
    if (GetStorage().read(GetStorageKey.IS_DARK_MODE) != null) {
      isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
    } else {
      var brightness = SchedulerBinding.instance!.window.platformBrightness;
      isDarkMode.value = brightness == Brightness.dark;
      _getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode.value);
    }
  }

  void changeTheme() {
    if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
      isDarkMode.value = false;
    } else {
      _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
      isDarkMode.value = true;
    }
  }
}
