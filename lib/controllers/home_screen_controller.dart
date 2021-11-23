import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController instance = Get.find();

  @override
  void onInit() {
    super.onInit();
    HttpService httpService = HttpService();
    httpService.getNotices(noticeRoute: "app/notices");
  }
}
