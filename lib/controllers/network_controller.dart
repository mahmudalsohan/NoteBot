import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/models/base_request_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NetworkController extends GetxController {
  static NetworkController instance = Get.find();

  final Connectivity _connectivity = Connectivity();

  static final String _primaryUrl = FlutterConfig.get('PRIMARY_URL');

  //final RxInt statusCode = 0.obs;
  final RxBool isConnected = false.obs;
  final RxBool isApiLive = false.obs;
  final RxString primaryBaseURL = "".obs;
  final RxString secondaryBaseURL = "".obs;
  final RxString selectedBaseURL = "".obs;
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
  }

  checkConnectivity() async {
    print("Check Connectivity Called");
    try {
      ConnectivityResult connectivityResult =
          await _connectivity.checkConnectivity();

      if (connectivityResult != ConnectivityResult.none) {
        await getJsonFile();
        isConnected.value = true;
      } else if (connectivityResult == ConnectivityResult.none) {
        isConnected.value = false;
      }
    } on Exception catch (e) {
      await HttpService().logErr(e.toString());
    }
  }

  getJsonFile() async {
    BaseRequest baseRequest;
    var response = await Dio().get(_primaryUrl);
    baseRequest = BaseRequest.fromJson(response.data);

    //
    primaryBaseURL.value = baseRequest.apiInfo.primary.liveApiUrl;
    secondaryBaseURL.value = baseRequest.apiInfo.secondary.liveApiUrl;
    isApiLive.value = baseRequest.apiInfo.isApiLive;
    memorialList.value = baseRequest.inMemoryOf;
    sponsorList.value = baseRequest.sponsoredContent;
    toolList.value = baseRequest.tools;
    communityList.value = baseRequest.communities;
    routineList.value = baseRequest.routines;
    resultList.value = baseRequest.results;
    apiAppVersion.value = baseRequest.appVersion;

    //
    getSelectedBaseURL();
    print(apiAppVersion.value);
  }

  getSelectedBaseURL() {
    var server = GetStorage().read(GetStorageKey.ACTIVE_SERVER);
    if (server == null || server == 'Server 1') {
      selectedBaseURL.value = primaryBaseURL.value;
    } else if (server == 'Server 2') {
      selectedBaseURL.value = secondaryBaseURL.value;
    }
  }
}
