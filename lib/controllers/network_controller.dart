import 'package:butex_notebot/models/base_request_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  static NetworkController instance = Get.find();

  late final Connectivity _connectivity;

  static final String _primaryUrl = FlutterConfig.get('PRIMARY_URL');

  //final RxInt statusCode = 0.obs;
  final RxBool isConnected = false.obs;
  final RxBool isApiLive = false.obs;
  final RxString BASE_URL = "".obs;
  final RxList<InMemoryOf> memorialList = <InMemoryOf>[].obs;
  final RxList<SponsoredContent> sponsorList = <SponsoredContent>[].obs;

  @override
  void onInit() async {
    super.onInit();
    _connectivity = Connectivity();
    await checkConnectivity();

    if (isConnected.value) {
      await _getBaseRequest();
    }
  }

  checkConnectivity() async {
    print("called");
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      await _getBaseRequest();
      isConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
    }
  }

  _getBaseRequest() async {
    BaseRequest baseRequest;
    var response = await Dio().get(_primaryUrl);
    baseRequest = BaseRequest.fromJson(response.data);

    //
    BASE_URL.value = baseRequest.apiInfo.primary.liveApiUrl;
    isApiLive.value = baseRequest.apiInfo.isApiLive;
    memorialList.value = baseRequest.inMemoryOf;
    sponsorList.value = baseRequest.sponsoredContent;
  }
}
