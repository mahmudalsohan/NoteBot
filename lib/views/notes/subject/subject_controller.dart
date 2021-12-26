import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class NotesSubjectController extends GetxController {
  final int level;
  NotesSubjectController(this.level);
  Rx<Future<List<Subject>>> subject = Future.value(<Subject>[]).obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    subject.value = HttpService().getSubjects(level: level);
  }
}
