import 'package:butex_notebot/constants/asset_path.dart';

import 'package:butex_notebot/widgets/level_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'leaderboard_screen.dart';
import 'notebird_play.dart';

class NotebirdHomeScreen extends StatelessWidget {
  const NotebirdHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteBird"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                LevelSelectionTile(
                  title: "Play",
                  onTap: () async {
                    Get.to(() => NotebirdPlayScreen());
                  },
                ),
                LevelSelectionTile(
                  title: "Leaderboard",
                  onTap: () {
                    Get.to(() => LeaderBoardScreen());
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Image(
              height: 250,
              width: 250,
              image: AssetImage(logoNoteBird),
            ),
          ],
        ),
      ),
    );
  }
}
