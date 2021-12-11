import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';

import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

final List<String> _images = [imageNotice0, imageNotice1, imageNotice2];

class NoticeView extends StatelessWidget {
  const NoticeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Butex Notices"),
      body: Obx(
        () => Container(
          child: noticeController.feed.value.items != null
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: noticeController.feed.value.items?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = noticeController.feed.value.items![index];
                    final String _date =
                        "${_monthName(item.pubDate?.month)} ${item.pubDate?.day}, ${item.pubDate?.year}";
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5.0, 12.0),
                                blurRadius: 5,
                                spreadRadius: 0,
                                color: Colors.black12,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              ),
                              child: Image.asset(
                                _images[index % 3],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: Text(
                                item.title ?? "Error Loading Data",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        _date,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.share_outlined,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
