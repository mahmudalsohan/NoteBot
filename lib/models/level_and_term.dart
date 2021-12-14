// To parse this JSON data, do
//
//     final levelAndTerm = levelAndTermFromJson(jsonString);

import 'dart:convert';

List<LevelAndTerm> levelAndTermFromJson(String str) => List<LevelAndTerm>.from(
    json.decode(str).map((x) => LevelAndTerm.fromJson(x)));

String levelAndTermToJson(List<LevelAndTerm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LevelAndTerm {
  LevelAndTerm({
    required this.topic,
    required this.url,
  });

  String topic;
  String url;

  factory LevelAndTerm.fromJson(Map<String, dynamic> json) => LevelAndTerm(
        topic: json["topic"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "topic": topic,
        "url": url,
      };
}
