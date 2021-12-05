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
  final Rx<RssFeed> feed = Rx(RssFeed());
  static String feedUrl = FlutterConfig.get('FEED_URL');
  final RxString title = "RSS DEMO TITLE".obs;

  static const String loadingFeedMsg = "loading feed...";
  static const String loadingFeedErrMsg = "Error loading feed...";

  @override
  void onInit() {
    super.onInit();
    //Load RSS
    load();

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

  //Here starts the methods of Fetching RSS Feed
  updateFeed(newFeed) {
    //print("updateFeed: Called");
    feed.value = newFeed;
    //print("updateFeed: ${feed.value.items!.length}");
    //print("updateFeed: Executed");
  }

  updateTitle(newTitle) {
    //print("updateTitle: Called");
    title.value = newTitle;
    //print("updateTitle: Executed");
  }

  load() {
    //print("load: called");
    updateTitle(loadingFeedMsg);
    loadFeed().then((res) {
      if (res == null || res.toString().isEmpty) {
        //print("load: Invalid Response Received");
        updateTitle(loadingFeedErrMsg);
        return;
      }
      //print("load: Valid Response Received");
      updateFeed(res);
      updateTitle(feed.value.title);
    });
    //print("load: Executed");
  }

  Future<RssFeed?> loadFeed() async {
    //print("loadFeed: called");
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(feedUrl));
      //print("loadFeed: Response Returned");
      return RssFeed.parse(response.body);
    } catch (e) {
      //print("loadFeed: Error");
    }
    //print("loadFeed: Null Returned");
    return null;
  }
  //
}
