import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/models/on_boarding_info.dart';
import 'package:butex_notebot/views/authentication/auth_view.dart';
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
      pageController.nextPage(duration: 500.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(imageOnboard1, 'Go Easy !',
        'Using your favourite NoteBOT is easier than ever '),
    OnboardingInfo(imageOnboard2, 'Packed With Features !',
        'Check Notes, Lab Reports, Syllabus, Notice and much more!\nAll in one place'),
    OnboardingInfo(imageOnboard3, 'Our BUTEX, Our NoteBOT',
        'ONE Institute, ONE App and Thousands of awesome people like you...')
  ];
}
