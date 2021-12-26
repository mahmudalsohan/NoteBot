import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class NotesTopicContentController extends GetxController {
  final String? topicRoute;
  NotesTopicContentController(this.topicRoute);
  Rx<Future<List<TopicContent>>> topicContents =
      Future.value(<TopicContent>[]).obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    topicContents.value = HttpService().getTopicContent(topicRoute!);
  }
}
