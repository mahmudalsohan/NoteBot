import 'package:butex_notebot/utils/open_url.dart';
import 'package:flutter/material.dart';

Widget devAvatar({
  required String image,
  required String name,
  required String dept,
  required String link,
}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(image),
      ),
      SizedBox(height: 10),
      InkWell(
        onTap: () {
          UrlLauncher.openUrl(url: link);
        },
        child: Text(
          name,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      SizedBox(height: 5),
      Text(dept),
    ],
  );
}
