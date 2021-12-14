// To parse this JSON data, do
//
//     final labTopicContent = labTopicContentFromJson(jsonString);

import 'dart:convert';

List<LabTopicContent> labTopicContentFromJson(String str) =>
    List<LabTopicContent>.from(
        json.decode(str).map((x) => LabTopicContent.fromJson(x)));

String labTopicContentToJson(List<LabTopicContent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabTopicContent {
  LabTopicContent({
    required this.title,
    required this.url,
  });

  String title;
  String url;

  factory LabTopicContent.fromJson(Map<String, dynamic> json) =>
      LabTopicContent(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}
