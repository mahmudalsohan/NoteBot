import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/about_us_view/widgets/developer_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_banner.dart';

Widget aboutUsSection() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aboutBanner(
          bannerColor: Colors.blue,
          title: "About Us",
          textColor: Colors.white,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 30, 30),
              child: Image.asset(logoCircleHawkers, height: 120),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HAWKERS is a group of Individuals who are passionate "
                    "about impactful Software Development.",
                  ),
                  SizedBox(height: 10),
                  Text("We make products that count."),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            devAvatar(
              image: imageTripto,
              name: "Afshin Nahian Tripto",
              dept: "IPE-43",
              link: "https://www.facebook.com/Tripto.Afsin",
            ),
            devAvatar(
              image: imageSohan,
              name: "Mahmud Al Sohan",
              dept: "WPE-46",
              link: "https://www.facebook.com/mahmudalsohan/",
            ),
          ],
        ),
      ],
    ),
  );
}
