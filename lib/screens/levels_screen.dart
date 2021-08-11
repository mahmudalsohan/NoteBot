import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/subjects_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/card_data.dart';
import 'package:butex_notebot/widgets/drawer_widget.dart';
import 'package:butex_notebot/widgets/reusable_card.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;
    List<CardInfo> levelScreenCards = [
      CardInfo(1,
        title: "Level 1",
        description: "Browse Notes, Routines, Q.Banks of your level",
        imagePath: "assets/images/l1.png",
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: SubjectsScreen(
                level: 1,
              ),
            ),
          );
        },
      ),
      CardInfo(4,
        title: "Level 4",
        description: "Play games, watch videos and much more!!!",
        imagePath: "assets/images/l4.png",
        onTap: () {
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: SubjectsScreen(
              level: 4,
            ),
          );
        },
      ),
      CardInfo(3,
        title: "Level 3",
        description: "Handy tools you need",
        imagePath: "assets/images/l3.png",
        onTap: () {
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: SubjectsScreen(
              level: 3,
            ),
          );
        },
      ),
      CardInfo(2,
        title: "Level 2",
        description: "See latest Notices from BUTEX",
        imagePath: "assets/images/l2.png",
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: SubjectsScreen(
                level: 2,
              ),
            ),
          );
        },
      ),
    ];
    return Scaffold(
      appBar: appBar(isDarkTheme),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopContainer(
                imagePath: "assets/images/notes.png",
                isDarkTheme: isDarkTheme,
                title: "Notes",
              ),
              Container(
                height: 500,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ReusableCard(
                      title: levelScreenCards[index].title,
                      description: levelScreenCards[index].description,
                      imagePath: levelScreenCards[index].imagePath,
                      onTap: levelScreenCards[index].onTap,
                    );
                  },
                  itemCount: levelScreenCards.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 50,
                  layout: SwiperLayout.STACK,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _levelList(
                    title: "Level 1",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SubjectsScreen(level: 1),
                        ),
                      );
                    },
                  ),
                  _levelList(
                    title: "Level 2",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SubjectsScreen(level: 2),
                        ),
                      );
                    },
                  ),
                  _levelList(
                    title: "Level 3",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SubjectsScreen(level: 3),
                        ),
                      );
                    },
                  ),
                  _levelList(
                    title: "Level 4",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SubjectsScreen(level: 4),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),*/
  /*Widget _levelList({
    required String title,
    required bool isDarkTheme,
    required Function onPress,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isDarkTheme ? Colors.blueGrey : Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isDarkTheme ? Colors.blueGrey.shade900 : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }*/
}
