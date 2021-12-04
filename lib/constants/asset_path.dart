String imageAssetsRoot = "assets/images/";

final String logo = _getImagePath("notebot.png");
final String academicImage = _getImagePath("academic.png");
final String noticeImage = _getImagePath("notice.png");
final String toolsImage = _getImagePath("tools.png");
final String entertainmentImage = _getImagePath("entertainment.png");
final String levelOneImage = _getImagePath("l1.png");
final String levelTwoImage = _getImagePath("l2.png");
final String levelThreeImage = _getImagePath("l3.png");
final String levelFourImage = _getImagePath("l4.png");
final String labReportSectionImage = _getImagePath("lab_reports.png");
final String noteSectionImage = _getImagePath("notes.png");
final String googleLogo = _getImagePath("google-logo.png");
final String messengerImage = _getImagePath("messenger.png");

String _getImagePath(String filename) {
  return imageAssetsRoot + filename;
}
