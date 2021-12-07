import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  static NetworkController instance = Get.find();

  late final Connectivity _connectivity;

  RxInt statusCode = 0.obs;
  RxBool isConnected = false.obs;

  @override
  void onInit() async {
    super.onInit();
    _connectivity = Connectivity();
    await checkConnectivity();
  }

  checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      isConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
    }
  }
}
