class CardInfo {
  final int position;
  final String title;
  final String imagePath;
  final String description;
  final Function onTap;

  CardInfo(
    this.position, {
    required this.title,
    required this.imagePath,
    required this.description,
    required this.onTap,
  });
}
