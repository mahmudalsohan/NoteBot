import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/carousel_loading.dart';
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
        height: 180,
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
                    child: InkWell(
                      onTap: () {
                        if (ad.url != false) {
                          UrlLauncher.openUrl(
                            url: ad.url,
                            context: context,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(8.0, 8.0),
                                blurRadius: 15,
                                spreadRadius: 0.1,
                                color: AppColors().kFunctionTileShadowColor)
                          ],
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 0),
                            colors: colors,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                          top: 15,
                                          right: 5,
                                        ),
                                        child: Text(
                                          ad.title,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyles()
                                              .kCarouselTitleTextStyle,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                          top: 5,
                                          bottom: 5,
                                        ),
                                        child: Text(
                                          ad.description,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyles()
                                              .kCarouselDescriptionTextStyle,
                                        ),
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
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: double.infinity,
                                        backgroundImage:
                                            NetworkImage(ad.imgUrl),
                                      )),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(25),
                                  ),
                                  color: Colors.black,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  child: Text(
                                    ad.type,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: networkController.sponsorList.length,
                viewportFraction: 0.9,
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
            : CarouselLoading(),
      ),
    );
  }
}
