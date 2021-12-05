import 'package:butex_notebot/controllers/app_controller.dart';
import 'package:butex_notebot/controllers/home_view_controller.dart';
import 'package:butex_notebot/controllers/theme_controller.dart';
import 'package:butex_notebot/controllers/auth_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

AppController appController = AppController.instance;
AuthController authController = AuthController.instance;
ThemeController themeController = ThemeController.instance;
HomeViewController homeViewController = HomeViewController.instance;

initializeControllers() {
  Get.put(AppController());
  Get.put(AuthController());
  Get.put(ThemeController());
  Get.put(HomeViewController());
}
