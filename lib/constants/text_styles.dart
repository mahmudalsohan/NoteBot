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
}
