// To parse this JSON data, do
//
//     final departments = departmentsFromJson(jsonString);

import 'dart:convert';

List<Departments> departmentsFromJson(String str) => List<Departments>.from(
    json.decode(str).map((x) => Departments.fromJson(x)));

String departmentsToJson(List<Departments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Departments {
  Departments({
    required this.dept,
    required this.route,
  });

  String dept;
  String route;

  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
        dept: json["dept"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "dept": dept,
        "route": route,
      };
}
