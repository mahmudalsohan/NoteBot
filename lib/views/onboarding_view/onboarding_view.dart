import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/auth_view/auth_view.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'A reader lives a thousand lives',
            body: 'The man who never reads lives only one.',
            image: Image.asset(imageOnboard1),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Featured Books',
            body: 'Available right at your fingerprints',
            image: Image.asset(imageOnboard2),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Simple UI',
            body: 'For enhanced reading experience',
            image: Image.asset(imageOnboard1),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Today a reader, tomorrow a leader',
            body: 'Start your journey',
            footer: ElevatedButton(
              child: Text("Launch"),
              onPressed: () {
                Get.offAll(() => HomeView());
              },
            ),
            image: Image.asset(imageOnboard1),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          Get.offAll(() => HomeView());
        },
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Colors.white,
        skipFlex: 0,
        nextFlex: 0,
        // isProgressTap: false,
        // isProgress: false,
        // showNextButton: false,
        // freeze: true,
        // animationDuration: 1000,
      ),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
