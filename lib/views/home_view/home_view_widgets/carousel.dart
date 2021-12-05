import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
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
    return Obx(() => Container(
          height: 160,
          width: Get.width,
          child: homeViewController.feed.value.items != null
              ? Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    final item = homeViewController.feed.value.items![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: AppColors().carouselGradientColors,
                          ),
                          boxShadow: AppColors().carouselShadowColors,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              child: Text(
                                item.title ?? "",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(item.pubDate.toString())
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: homeViewController.feed.value.items!.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  autoplay: true,
                  pagination: SwiperPagination(),
                  duration: 500,
                  curve: Curves.easeInOutQuart,
                )
              : Center(child: CircularProgressIndicator()),
        ));
  }
}
