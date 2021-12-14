// To parse this JSON data, do
//
//     final labTopics = labTopicsFromJson(jsonString);

import 'dart:convert';

List<LabTopics> labTopicsFromJson(String str) =>
    List<LabTopics>.from(json.decode(str).map((x) => LabTopics.fromJson(x)));

String labTopicsToJson(List<LabTopics> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabTopics {
  LabTopics({
    required this.topic,
    this.url,
    this.route,
  });

  String topic;
  String? url;
  String? route;

  factory LabTopics.fromJson(Map<String, dynamic> json) => LabTopics(
        topic: json["topic"],
        url: json["url"] == null ? null : json["url"],
        route: json["route"] == null ? null : json["route"],
      );

  Map<String, dynamic> toJson() => {
        "topic": topic,
        "url": url == null ? null : url,
        "route": route == null ? null : route,
      };
}
