String imageAssetsRoot = "assets/images/";

final String logo = _getImagePath("notebot.png");
final String notesSectionImage = _getImagePath("bookshelf.png");
final String syllabusSectionImage = _getImagePath("curriculum.png");
final String noticeSectionImage = _getImagePath("notice.png");
final String toolsSectionImage = _getImagePath("tool-box.png");
final String entertainmentSectionImage = _getImagePath("confetti.png");
final String labReportSectionImage = _getImagePath("clipboard.png");
final String googleLogo = _getImagePath("google-logo.png");
final String messengerImage = _getImagePath("messenger.png");

String _getImagePath(String filename) {
  return imageAssetsRoot + filename;
}
