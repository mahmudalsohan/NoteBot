import 'package:butex_notebot/models/lab_subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class LabSubjectController extends GetxController {
  final int level;
  LabSubjectController(this.level);
  Rx<Future<List<LabSubject>>> subject = Future.value(<LabSubject>[]).obs;

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    subject.value = HttpService().getLabSubjects(level);
  }
}
