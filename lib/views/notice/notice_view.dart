import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/notice/notice_controller.dart';

import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/notice_card.dart';
import 'package:butex_notebot/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

final List<String> _images = [imageNotice0, imageNotice1, imageNotice2];

class NoticeView extends GetView<NoticeController> {
  const NoticeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    Get.put<NoticeController>(NoticeController());
    //
    return Scaffold(
      appBar: customAppBar(context: context, title: "Butex Notices"),
      body: Obx(
        () => Container(
          child: controller.feed.value.items != null
              ? RefreshIndicator(
                  onRefresh: () {
                    EasyLoading.show(status: "Loading...");
                    return controller.reload();
                  },
                  child: ListView.builder(
                    itemCount: controller.feed.value.items?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = controller.feed.value.items![index];
                      final String _date =
                          "${_monthName(item.pubDate?.month)} ${item.pubDate?.day}, ${item.pubDate?.year}";
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: NoticeCard(
                          onTap: () {
                            if (appController.inAppWebView.value) {
                              Get.to(
                                () => OpenWebView(
                                  title: "BUTEX Notices",
                                  url: item.link ?? "https://butex.edu.bd",
                                ),
                              );
                            } else {
                              UrlLauncher.openUrl(
                                url: item.link,
                                context: context,
                              );
                            }
                          },
                          title: item.title,
                          image: _images[index % 3],
                          shareLink: item.link,
                          date: _date,
                        ),
                      );
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  String _monthName(int? monthNumber) {
    switch (monthNumber) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Error";
    }
  }
}
