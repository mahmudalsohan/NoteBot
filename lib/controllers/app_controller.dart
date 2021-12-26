import 'dart:developer';

import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io' show Platform;

import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  final RxBool firstTime = false.obs;
  final RxString appVersion = "1.0.0".obs;
  final RxString osVersion = "".obs;
  final RxBool inAppWebView = true.obs;
  late final GetStorage _getStorage;

  @override
  void onInit() {
    super.onInit();
    osVersion.value = Platform.operatingSystemVersion;
    _getStorage = GetStorage();

    if (GetStorage().read(GetStorageKey.FIRST_TIME) == null) {
      firstTime.value = true;
    } else {
      firstTime.value = GetStorage().read(GetStorageKey.FIRST_TIME);
    }

    LocalNotificationService.initialize();

    //gives the message on which user taps
    //and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Get.toNamed(routeFromMessage);
        print(routeFromMessage);
      }
    });

    //works in foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
      }

      LocalNotificationService.display(message);
    });

    //When the app is in background but opened
    //and user taps into it
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Get.toNamed(routeFromMessage);
      print(routeFromMessage);
    });

    _getStorage.read(GetStorageKey.IN_APP_WEB_VIEW) == null
        ? _getStorage.write(GetStorageKey.IN_APP_WEB_VIEW, inAppWebView.value)
        : inAppWebView.value = _getStorage.read(GetStorageKey.IN_APP_WEB_VIEW);
  }

  switchInAppWebView() {
    if (_getStorage.read(GetStorageKey.IN_APP_WEB_VIEW)) {
      _getStorage.write(GetStorageKey.IN_APP_WEB_VIEW, false);
      inAppWebView.value = false;
    } else {
      _getStorage.write(GetStorageKey.IN_APP_WEB_VIEW, true);
      inAppWebView.value = true;
    }
  }
}
