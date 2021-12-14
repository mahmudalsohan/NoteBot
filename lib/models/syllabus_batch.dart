// To parse this JSON data, do
//
//     final syllabusBatch = syllabusBatchFromJson(jsonString);

import 'dart:convert';

List<SyllabusBatch> syllabusBatchFromJson(String str) =>
    List<SyllabusBatch>.from(
        json.decode(str).map((x) => SyllabusBatch.fromJson(x)));

String syllabusBatchToJson(List<SyllabusBatch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyllabusBatch {
  SyllabusBatch({
    required this.batch,
    required this.route,
  });

  String batch;
  String route;

  factory SyllabusBatch.fromJson(Map<String, dynamic> json) => SyllabusBatch(
        batch: json["batch"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "batch": batch,
        "route": route,
      };
}
