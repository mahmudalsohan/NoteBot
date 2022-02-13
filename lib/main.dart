import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/firebase.dart';
import 'package:butex_notebot/constants/themes.dart';
import 'package:butex_notebot/views/authentication/auth_view.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/views/onboarding/onboarding_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_config/flutter_config.dart';
import 'constants/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:alice/alice.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Alice alice = Alice(showNotification: false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await initializeGetStorage();
  await initializeFirebase.then((value) {
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    initializeControllers();
    print("Changed");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        getPages: [
          GetPage(name: '/', page: () => AuthView()),
          GetPage(name: '/home', page: () => HomeView())
        ],
        initialRoute: '/',
        title: "NoteBOT",
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightThemeData,
        darkTheme: AppThemes.darkThemeData,
        themeMode: themeController.isDarkMode.value
            ? AppThemes.darkThemeMode
            : AppThemes.lightThemeMode,
        home: appController.firstTime.value ? OnBoardingView() : AuthView(),
        defaultTransition: Transition.rightToLeft,
        builder: EasyLoading.init(),
        navigatorKey: alice.getNavigatorKey(),
      ),
    );
  }
}
