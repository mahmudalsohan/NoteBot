import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
        left: 30,
        right: 30,
      ),
      child: SkeletonAnimation(
        shimmerColor: themeController.isDarkMode.value
            ? Colors.white54
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(8.0, 8.0),
                blurRadius: 15,
                spreadRadius: 0.1,
                color: AppColors().kFunctionTileShadowColor,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.onBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors().kCarouselShimmerBGColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        //width: Get.width * 0.35,
                        height: 15,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors().kCarouselShimmerBGColor,
                              borderRadius: BorderRadius.circular(1),
                            ),
                            width: Get.width * 0.30,
                            height: 5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors().kCarouselShimmerBGColor,
                              borderRadius: BorderRadius.circular(1),
                            ),
                            width: Get.width * 0.20,
                            height: 5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors().kCarouselShimmerBGColor,
                              borderRadius: BorderRadius.circular(1),
                            ),
                            width: Get.width * 0.25,
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 5,
                    top: 10,
                    bottom: 10,
                  ),
                  child: CircleAvatar(
                    radius: double.infinity,
                    backgroundColor: AppColors().kCarouselShimmerBGColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
