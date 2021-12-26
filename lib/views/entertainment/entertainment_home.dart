import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_core/src/get_main.dart';

import 'jokes/jokes_home_view.dart';
import 'notebird/notebird_home_screen.dart';

class EntertainmentHomeScreen extends StatelessWidget {
  const EntertainmentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Fun"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              children: [
                FunctionTile(
                  title: "Note Bird",
                  image: AssetImage(logoNoteBird),
                  onPress: () {
                    Get.to(() => NotebirdHomeScreen());
                  },
                ),
                FunctionTile(
                  title: "Jokes",
                  image: AssetImage(imageJokeSection),
                  onPress: () {
                    Get.to(() => JokesHomeView());
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Image.asset(
                imageEntertainmentSection,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
