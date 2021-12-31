import 'package:butex_notebot/models/notebird_hof.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class LeaderBoardController extends GetxController {
  final Rx<Future<NoteBirdHof>> hof = Rx(Future.value(NoteBirdHof(hof: [])));

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  reload() async {
    hof.value = HttpService().getHOF();
  }
}
