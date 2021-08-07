class TopicContent {
  late String title;
  late String url;

  TopicContent({
    required this.title,
    required this.url,
  });

  TopicContent.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }
}
