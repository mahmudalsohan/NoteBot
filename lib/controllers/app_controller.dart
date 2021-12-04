import 'package:butex_notebot/services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();

  @override
  void onInit() {
    super.onInit();
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
  }
}
