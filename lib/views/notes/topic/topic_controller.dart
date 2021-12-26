import 'package:butex_notebot/models/topic_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class NotesTopicController extends GetxController {
  final String? subjectRoute;
  NotesTopicController(this.subjectRoute);
  Rx<Future<List<Topic>>> topics = Future.value(<Topic>[]).obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    topics.value = HttpService().getTopics(subjectRoute: subjectRoute!);
  }
}
