import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NoticeCard extends StatelessWidget {
  final Function onTap;
  final String image;
  final String? title;
  final String date;
  final String? shareLink;
  const NoticeCard({
    Key? key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.date,
    required this.shareLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        //
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeController.isDarkMode.value
                ? Color(0xff1a2d3d)
                : Theme.of(context).colorScheme.background,
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
              child: Image.asset(image
                  //
                  ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                title ?? "Error Loading Data",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        date,
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
                    onPressed: () {
                      Share.share(
                        "$shareLink \n\n-Sharing from our NoteBOT App",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
