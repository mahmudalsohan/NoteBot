import 'package:butex_notebot/services/open_url.dart';
import 'package:flutter/material.dart';

Widget devAvatar(
  context, {
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
          UrlLauncher.openUrl(
            url: link,
            context: context,
          );
        },
        child: Text(
          name,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      SizedBox(height: 5),
      Text(dept),
    ],
  );
}
