import 'package:flutter/cupertino.dart';
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
    fontSize: 22,
    color: AppColors().kSecondaryTextColor,
  );

  var kSelectLevelButtonTextStyle = GoogleFonts.montserrat(
    fontSize: 25,
    color: AppColors().kSecondaryTextColor,
  );
}
