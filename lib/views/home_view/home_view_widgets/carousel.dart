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
    return Container(
      height: 160,
      width: Get.width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          final int idx = index % 3;
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: AppColors().carouselGradientColors[idx],
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
                      "New Announcement for University Day Cultural Programme",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text("Dec 22, 2021")
                ],
              ),
            ),
          );
        },
        itemCount: 5,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          activeColor: Theme.of(context).primaryColor,
          color: Colors.grey,
        )),
        duration: 500,
        curve: Curves.easeInOutQuart,
      ),
    );
  }
}
