import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/material.dart';

class AppColors {
  /*static const Color _kKeyUmbraOpacity = Color(0x33000000);
  static const Color _kKeyPenumbraOpacity = Color(0x24000000);
  static const Color _kAmbientShadowOpacity = Color(0x1F000000);*/

  /*List carouselGradientColors = [
    [
      Color(0xffffe287),
      Color(0xffffc103),
      Color(0xffffc000),
    ],
    [
      Color(0xfffe9d9b),
      Color(0xfff85b50),
      Color(0xfffc5c4d),
    ],
    [
      Color(0xff9996fb),
      Color(0xff7c3efb),
      Color(0xff8037fa),
    ],
  ];
*/
  /*final List<BoxShadow> carouselShadowColors = themeController.isDarkMode.value
      ? [
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
        ]
      : [
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
        ];*/

  var kFunctionTileShadowColor = Colors.black12;

  var kPrimaryTextColor =
      themeController.isDarkMode.value ? Color(0xDDFFFFFF) : Color(0xDD000000);
  var kSecondaryTextColor =
      themeController.isDarkMode.value ? Colors.white : Colors.black;

  var kThemeIconColor =
      themeController.isDarkMode.value ? Colors.yellow : Colors.black;

  var kCarouselShimmerBGColor =
      themeController.isDarkMode.value ? Color(0xff1a2d3d) : Colors.grey[200];
}
