import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'get_storage_key.dart';

class AppColors {
  static const Color _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
  static const Color _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
  static const Color _kAmbientShadowOpacity = Color(0x1F000000);

  var carouselGradientColors = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? [
          Colors.lightBlue,
          Colors.lightBlue.shade100,
        ]
      : [
          Colors.deepPurple.shade300,
          Color(0xFF6200EE),
        ];

  final List<BoxShadow> carouselShadowColors =
      GetStorage().read(GetStorageKey.IS_DARK_MODE)
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
            ];

  var kPrimaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Color(0xDDFFFFFF)
      : Color(0xDD000000);
  var kSecondaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Colors.white
      : Colors.black;
  var kBlackColor = Colors.black;

  var kThemeIconColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Colors.yellow
      : Colors.black;
}
