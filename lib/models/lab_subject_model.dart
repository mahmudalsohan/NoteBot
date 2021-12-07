// To parse this JSON data, do
//
//     final labSubjects = labSubjectsFromJson(jsonString);

import 'dart:convert';

List<LabSubject> labSubjectsFromJson(String str) =>
    List<LabSubject>.from(json.decode(str).map((x) => LabSubject.fromJson(x)));

String labSubjectsToJson(List<LabSubject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabSubject {
  LabSubject({
    required this.subName,
    required this.route,
  });

  String subName;
  String route;

  factory LabSubject.fromJson(Map<String, dynamic> json) => LabSubject(
        subName: json["subName"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "subName": subName,
        "route": route,
      };
}
