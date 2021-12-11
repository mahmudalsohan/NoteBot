final String imageAssetsRoot = "assets/images/";

//Logo
final String logoNotebot = _getImagePath("notebot.png");
final String logoHawkers = _getImagePath("Hawkers_white.png");
final String logoCircleHawkers = _getImagePath("hawkers_inCircle.png");
final String logoHawkersBlack = _getImagePath("hawkers_black.png");

//Images
final String imageNotesSection = _getImagePath("bookshelf.png");
final String imageSyllabusSection = _getImagePath("curriculum.png");
final String imageNoticeSection = _getImagePath("notice.png");
final String imageToolsSection = _getImagePath("tool-box.png");
final String imageEntertainmentSection = _getImagePath("confetti.png");
final String imageLabReportSection = _getImagePath("clipboard.png");
final String imageTripto = _getImagePath("tripto.jpg");
final String imageSohan = _getImagePath("sohan.jpg");
final String imageNotice0 = _getImagePath("butex0.jpg");
final String imageNotice1 = _getImagePath("butex0.jpg");
final String imageNotice2 = _getImagePath("butex0.jpg");

//Icons
final String iconMessenger = _getImagePath("messenger.png");
final String iconGoogle = _getImagePath("google-logo.png");

String _getImagePath(String filename) {
  return imageAssetsRoot + filename;
}
