import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  var kTopContainerTextStyle = GoogleFonts.montserrat(
    fontSize: 20,
    color: AppColors().kPrimaryTextColor,
    fontWeight: FontWeight.bold,
  );

  var kFunctionTileTextStyle = GoogleFonts.montserrat(
    fontSize: 15,
    color: AppColors().kSecondaryTextColor,
  );

  var kHomeViewTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 25,
    color: AppColors().kSecondaryTextColor,
  );

  var kShortcutChipTextStyle = GoogleFonts.montserrat(
    fontSize: 15,
    color: AppColors().kSecondaryTextColor,
  );

  var kLevelsViewTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 20,
    color: AppColors().kSecondaryTextColor,
  );

  var kSelectLevelButtonTextStyle = GoogleFonts.montserrat(
    fontSize: 25,
    color: Colors.white,
  );

  var kCarouselTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 20,
    color: Colors.white,
  );

  var kCarouselDescriptionTextStyle = GoogleFonts.montserrat(
    fontSize: 12,
    color: Colors.white,
  );
}
