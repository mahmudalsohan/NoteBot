import 'package:dio/dio.dart' as DIO;
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:webfeed/domain/rss_feed.dart';

class NoticeController extends GetxController {
  static NoticeController instance = Get.find();

  final Rx<RssFeed> feed = Rx(RssFeed());
  static String feedUrl = FlutterConfig.get('FEED_URL');
  final RxString title = "RSS DEMO TITLE".obs;

  static const String loadingFeedMsg = "loading feed...";
  static const String loadingFeedErrMsg = "Error loading feed...";

  @override
  void onInit() {
    super.onInit();
    load();
  }

  updateFeed(newFeed) {
    feed.value = newFeed;
  }

  updateTitle(newTitle) {
    title.value = newTitle;
  }

  load() {
    print("Load Called");
    updateTitle(loadingFeedMsg);
    loadFeed().then((res) {
      if (res == null || res.toString().isEmpty) {
        updateTitle(loadingFeedErrMsg);
        return;
      }
      updateFeed(res);
      updateTitle(feed.value.title);
    });
  }

  Future<RssFeed?> loadFeed() async {
    try {
      DIO.Response response = await DIO.Dio().get(feedUrl);

      return RssFeed.parse(response.data);
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
