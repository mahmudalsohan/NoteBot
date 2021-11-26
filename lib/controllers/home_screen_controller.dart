import 'package:butex_notebot/models/shortcut_chip.dart';
import 'package:get/get.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  static HomeScreenController instance = Get.find();

  List allChips = <ShortcutChip>[].obs;
  static const String FEED_URL = "https://www.butex.edu.bd/feed";
  RxString title = "RSS DEMO TITLE".obs;
  Rx<RssFeed> feed = Rx(RssFeed());
  static const String loadingFeedMsg = "loading feed...";
  static const String loadingFeedErrMsg = "Error loading feed...";

  @override
  void onInit() {
    super.onInit();
    //print("InitState: Called");
    //load();
    //print("InitState: Executed");
  }

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
      final response = await client.get(Uri.parse(FEED_URL));
      //print("loadFeed: Response Returned");
      return RssFeed.parse(response.body);
    } catch (e) {
      //print("loadFeed: Error");
    }
    //print("loadFeed: Null Returned");
    return null;
  }
}
