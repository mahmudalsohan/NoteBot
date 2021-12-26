import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:flutter/material.dart';

import 'about_banner.dart';
import 'developer_avatar.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutBanner(
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HAWKERS is a group of individuals who are passionate "
                        "about impactful Software Development ",
                        style: AppTextStyles().kAboutViewDescriptionTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "We make products that count ",
                        style: AppTextStyles().kAboutViewDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              devAvatar(
                context,
                image: imageTripto,
                name: "Afshin Nahian Tripto",
                dept: "IPE-44",
                link: "https://www.facebook.com/Tripto.Afsin",
              ),
              devAvatar(
                context,
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
}
