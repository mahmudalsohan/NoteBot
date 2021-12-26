import 'package:butex_notebot/models/lab_topic_content.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class LabTopicContentController extends GetxController {
  final String? route;
  LabTopicContentController(this.route);
  Rx<Future<List<LabTopicContent>>> topicContents =
      Future.value(<LabTopicContent>[]).obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    topicContents.value = HttpService().getLabTopicContent(route!);
  }
}
