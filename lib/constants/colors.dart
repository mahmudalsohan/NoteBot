import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'get_storage_key.dart';

class AppColors {
  var carouselCardGradient = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? [
          Colors.lightBlue,
          Colors.lightBlue.shade100,
        ]
      : [
          Color(0xFF6200EE),
          Colors.deepPurple.shade300,
        ];

  var kPrimaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Color(0xDDFFFFFF)
      : Color(0xDD000000);
  var kSecondaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Color(0xDDFFFFFF)
      : Color(0xDDFFFFFF);
  var kBlackColor = Colors.black;

  var kThemeIconColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? Colors.yellow
      : Colors.black;
}
