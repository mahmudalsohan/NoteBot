import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
    const Color _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
    const Color _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
    const Color _kAmbientShadowOpacity = Color(0x1F000000);
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
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: -1.0,
                                color: _kKeyUmbraOpacity),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                color: _kKeyPenumbraOpacity),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                color: _kAmbientShadowOpacity),
                          ],
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
