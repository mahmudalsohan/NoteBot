import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class HomeViewController extends GetxController {
  static HomeViewController instance = Get.find();

  late final GetStorage _getStorage;

  final RxList chipTitles = [].obs;

  @override
  void onInit() {
    super.onInit();
    //Initialize Get Storage
    _getStorage = GetStorage();

    //Get the saved shortcut chips from storage
    getShortcutChips();
  }

  getShortcutChips() {
    if (_getStorage.read(GetStorageKey.SHORTCUT_CHIPS) != null) {
      chipTitles.value = _getStorage.read(GetStorageKey.SHORTCUT_CHIPS);
    }
  }

  updateChipsStorage() {
    _getStorage.write(GetStorageKey.SHORTCUT_CHIPS, chipTitles);
  }
}
