import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 160,
        width: Get.width,
        child: networkController.sponsorList.length > 0
            ? Swiper(
                autoplayDelay: 5000,
                itemBuilder: (BuildContext context, int index) {
                  var ad = networkController.sponsorList[index];
                  final List<Color> colors = <Color>[];
                  for (int i = 0; i < ad.accentColor.length; i++) {
                    colors.add(Color(int.parse("0xff${ad.accentColor[i]}")));
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
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
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8, 0),
                          colors: colors,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 5,
                                  ),
                                  child: Text(
                                    ad.title,
                                    textAlign: TextAlign.center,
                                    style:
                                        AppTextStyles().kCarouselTitleTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    ad.description,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles()
                                        .kCarouselDescriptionTextStyle,
                                  ),
                                )
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
                                  backgroundColor: Colors.transparent,
                                  radius: double.infinity,
                                  backgroundImage: NetworkImage(ad.imgUrl),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: networkController.sponsorList.length,
                viewportFraction: 0.8,
                scale: 0.9,
                autoplay: true,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  activeColor: Theme.of(context).colorScheme.primary,
                  color: Colors.grey,
                )),
                duration: 500,
                curve: Curves.easeInOutQuart,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
