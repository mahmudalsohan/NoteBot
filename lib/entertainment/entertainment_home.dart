import 'package:butex_notebot/entertainment/notebird/notebird_home.dart';
import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EntertainmentHomeScreen extends StatelessWidget {
  const EntertainmentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;
    return Scaffold(
      appBar: customAppBar(isDarkTheme),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            TopContainer(
              imagePath: "assets/images/entertainment.png",
              isDarkTheme: isDarkTheme,
              title: "Entertainment",
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  FunctionTile(
                    title: "Note Bird",
                    imagePath: "assets/images/notebot_logo.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: NotebirdHomePage(),
                          type: PageTransitionType.rightToLeft,
                        ),
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
