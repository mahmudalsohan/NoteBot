import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/levels_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/card_data.dart';
import 'package:butex_notebot/widgets/reusable_card.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;

    List<CardInfo> academicScreenCards = [
      CardInfo(1,
        title: "Notes",
        description:
        "Browse Notes of your desired level",
        imagePath: "assets/images/notes.png",
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: LevelsScreen()));
        },
      ),
      CardInfo(2,
        title: "Lab Reports",
        description: "Browse lab reports from different levels",
        imagePath: "assets/images/lab_reports.png",
        onTap: () {},
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
                imagePath: "assets/images/academic.png",
                isDarkTheme: isDarkTheme,
                title: "Academic",
              ),
              Container(
                height: 500,
                child: Swiper(
                  itemCount: academicScreenCards.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 50,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (BuildContext context, int index) {
                    return ReusableCard(
                      title: academicScreenCards[index].title,
                      description: academicScreenCards[index].description,
                      imagePath: academicScreenCards[index].imagePath,
                      onTap: academicScreenCards[index].onTap,
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
                    title: "Notes",
                    imagePath: "assets/images/notes.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LevelsScreen(),
                        ),
                      );
                    },
                  ),
                  FunctionTile(
                    title: "Lab Reports",
                    imagePath: "assets/images/lab_reports.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                ],
              ),
            ),*/