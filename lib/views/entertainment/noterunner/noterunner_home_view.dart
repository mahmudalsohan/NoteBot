import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/entertainment/noterunner/note_runner_play_screen.dart';
import 'package:butex_notebot/widgets/level_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class NoteRunnerHomeView extends StatelessWidget {
  const NoteRunnerHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Runner"),
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
                  onTap: () {
                    Get.to(() => NoteRunnerPlayScreen());
                  },
                ),
                LevelSelectionTile(
                  title: "Leaderboard",
                  onTap: () {
                    //Get.to(() => LeaderBoardScreen());
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Image(
              height: 250,
              width: 250,
              image: AssetImage(logoNoteRunner),
            ),
          ],
        ),
      ),
    );
  }
}
