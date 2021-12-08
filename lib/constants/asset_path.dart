final String imageAssetsRoot = "assets/images/";

//Logo
final String logoNotebot = _getImagePath("notebot.png");
final String logoHawkers = _getImagePath("Hawkers_white.png");
final String logoCircleHawkers = _getImagePath("hawkers_inCircle.png");

//Images
final String imageNotesSection = _getImagePath("bookshelf.png");
final String imageSyllabusSection = _getImagePath("curriculum.png");
final String imageNoticeSection = _getImagePath("notice.png");
final String imageToolsSection = _getImagePath("tool-box.png");
final String imageEntertainmentSection = _getImagePath("confetti.png");
final String imageLabReportSection = _getImagePath("clipboard.png");

//Icons
final String iconMessenger = _getImagePath("messenger.png");
final String iconGoogle = _getImagePath("google-logo.png");

String _getImagePath(String filename) {
  return imageAssetsRoot + filename;
}
