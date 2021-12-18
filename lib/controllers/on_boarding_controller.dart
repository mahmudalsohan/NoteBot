import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/models/on_boarding_info.dart';
import 'package:butex_notebot/views/auth_view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      GetStorage().write(GetStorageKey.FIRST_TIME, false);
      Get.to(() => AuthView());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(imageOnboard1, 'GO Easy !',
        'Using Your Favourite NoteBOT is Easier Than Ever Before.'),
    OnboardingInfo(imageOnboard2, 'Packed With Features !',
        'Checks Notes, Lab Reports, Syllabus, Notice and much more, All in One Place'),
    OnboardingInfo(imageOnboard3, 'Our BUTEX, Our NoteBOT',
        'ONE Institute, ONE App, Thousands of Awesome Peoples Like You...')
  ];
}
