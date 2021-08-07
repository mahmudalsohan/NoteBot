class Topic {
  late String topic;
  late String? route;
  late String? url;

  Topic({
    required this.topic,
    this.route,
    this.url,
  });

  Topic.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    url = json['url'];
    route = json['route'];
  }
}
