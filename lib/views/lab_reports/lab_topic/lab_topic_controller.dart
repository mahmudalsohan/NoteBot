import 'package:butex_notebot/models/lab_topics.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class LabTopicController extends GetxController {
  final String route;
  LabTopicController(this.route);
  Rx<Future<List<LabTopics>>> topics = Future.value(<LabTopics>[]).obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    topics.value = HttpService().getLabTopics(route);
  }
}
