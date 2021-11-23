// To parse this JSON data, do
//
//     final notice = noticeFromJson(jsonString);

import 'dart:convert';

List<Notice> noticeFromJson(String str) =>
    List<Notice>.from(json.decode(str).map((x) => Notice.fromJson(x)));

String noticeToJson(List<Notice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notice {
  Notice({
    this.title,
    this.url,
    this.date,
    this.category,
  });

  String? title;
  String? url;
  String? date;
  dynamic category;

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        title: json["title"],
        url: json["url"],
        date: json["date"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "date": date,
        "category": category,
      };
}
