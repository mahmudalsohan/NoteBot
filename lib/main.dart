import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:butex_notebot/constants/firebase.dart';
import 'package:butex_notebot/constants/themes.dart';
import 'package:butex_notebot/controllers/app_controller.dart';
import 'package:butex_notebot/controllers/theme_controller.dart';
import 'package:butex_notebot/views/academic_views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';

import 'constants/get_storage_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final _getStorage = GetStorage();
  bool isDarkMode = _getStorage.read(GetStorageKey.IS_DARK_MODE) ?? false;
  _getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);
  await initializeFirebase.then((value) {
    Get.put(AppController());
    Get.put(ThemeController());
  });
  runApp(
    ThemeProvider(
      initTheme:
          isDarkMode ? AppThemes.darkThemeData : AppThemes.lightThemeData,
      child: Builder(
        builder: (context) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          theme: ThemeProvider.of(context),
          darkTheme: AppThemes.darkThemeData,
          defaultTransition: Transition.rightToLeft,
        ),
      ),
    ),
  );
}
