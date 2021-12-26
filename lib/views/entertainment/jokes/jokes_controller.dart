import 'package:butex_notebot/networking/http_service.dart';
import 'package:get/get.dart';

class JokesController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString joke =
      "Everytime you say 'Once More' you get a new joke !".obs;

  getJoke() async {
    isLoading.value = true;
    var response = await HttpService().get("app/jokes");
    isLoading.value = false;
    joke.value = response.data;
  }
}
