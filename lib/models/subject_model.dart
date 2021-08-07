class Subject {
  late String subName;
  late String? route;
  late String? url;

  Subject({
    required this.subName,
    this.route,
    this.url,
  });

  Subject.fromJson(Map<String, dynamic> json) {
    subName = json['subName'];
    url = json['url'];
    route = json['route'];
  }
}
