import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/academic_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/card_data.dart';
import 'package:butex_notebot/widgets/drawer_widget.dart';
import 'package:butex_notebot/widgets/reusable_card.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;
    List<CardInfo> homeScreenCards = [
      CardInfo(
        1,
        title: "Academic",
        description: "Browse Notes, Routines, Q.Banks of your level",
        imagePath: "assets/images/academic.png",
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: AcademicScreen()));
        },
      ),
      CardInfo(
        4,
        title: "Entertainment",
        description: "Play games, watch videos and much more!!!",
        imagePath: "assets/images/entertainment.png",
        onTap: () {},
      ),
      CardInfo(
        3,
        title: "Tools",
        description: "Handy tools you need",
        imagePath: "assets/images/tools.png",
        onTap: () {},
      ),
      CardInfo(
        2,
        title: "Notice",
        description: "See latest Notices from BUTEX",
        imagePath: "assets/images/notice.png",
        onTap: () {},
      ),
    ];
    return Scaffold(
      drawer: drawer(isDarkTheme),
      appBar: appBar(isDarkTheme),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopContainer(
                imagePath: "assets/images/notebot_logo.png",
                isDarkTheme: isDarkTheme,
              ),
              Container(
                height: 500,
                child: Swiper(
                  itemCount: homeScreenCards.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 50,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (BuildContext context, int index) {
                    return ReusableCard(
                      title: homeScreenCards[index].title,
                      description: homeScreenCards[index].description,
                      imagePath: homeScreenCards[index].imagePath,
                      onTap: homeScreenCards[index].onTap,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  FunctionTile(
                    title: "Academic",
                    imagePath: "assets/images/academic.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AcademicScreen(),
                        ),
                      );
                    },
                  ),
                  FunctionTile(
                    title: "Notice",
                    imagePath: "assets/images/notice.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                  FunctionTile(
                    title: "Tools",
                    imagePath: "assets/images/tools.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                  FunctionTile(
                    title: "Entertainment",
                    imagePath: "assets/images/entertainment.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                ],
              ),
            ),*/
