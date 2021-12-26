import 'package:butex_notebot/models/base_request_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  static NetworkController instance = Get.find();

  final Connectivity _connectivity = Connectivity();

  static final String _primaryUrl = FlutterConfig.get('PRIMARY_URL');

  //final RxInt statusCode = 0.obs;
  final RxBool isConnected = false.obs;
  final RxBool isApiLive = false.obs;
  final RxString BASE_URL = "".obs;
  final RxList<InMemoryOf> memorialList = <InMemoryOf>[].obs;
  final RxList<SponsoredContent> sponsorList = <SponsoredContent>[].obs;
  final RxList<Tool> toolList = <Tool>[].obs;
  final RxList<Community> communityList = <Community>[].obs;
  final RxList<Routine> routineList = <Routine>[].obs;
  final RxList<Result> resultList = <Result>[].obs;
  final RxString apiAppVersion = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await checkConnectivity();

    if (isConnected.value) {
      await getBaseRequest();
    }
  }

  checkConnectivity() async {
    print("Check Connectivity Called");
    try {
      ConnectivityResult connectivityResult =
          await _connectivity.checkConnectivity();

      if (connectivityResult != ConnectivityResult.none) {
        await getBaseRequest();
        isConnected.value = true;
      } else if (connectivityResult == ConnectivityResult.none) {
        isConnected.value = false;
      }
    } on Exception catch (e) {
      await HttpService().logErr(e.toString());
    }
  }

  getBaseRequest() async {
    BaseRequest baseRequest;
    var response = await Dio().get(_primaryUrl);
    baseRequest = BaseRequest.fromJson(response.data);

    //
    BASE_URL.value = baseRequest.apiInfo.primary.liveApiUrl;
    isApiLive.value = baseRequest.apiInfo.isApiLive;
    memorialList.value = baseRequest.inMemoryOf;
    sponsorList.value = baseRequest.sponsoredContent;
    toolList.value = baseRequest.tools;
    communityList.value = baseRequest.communities;
    routineList.value = baseRequest.routines;
    resultList.value = baseRequest.results;
    apiAppVersion.value = baseRequest.appVersion;
    print(apiAppVersion.value);
  }
}
