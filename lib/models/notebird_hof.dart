// To parse this JSON data, do
//
//     final noteBirdHof = noteBirdHofFromJson(jsonString);

import 'dart:convert';

NoteBirdHof noteBirdHofFromJson(String str) =>
    NoteBirdHof.fromJson(json.decode(str));

String noteBirdHofToJson(NoteBirdHof data) => json.encode(data.toJson());

class NoteBirdHof {
  NoteBirdHof({
    required this.hof,
  });

  List<Hof> hof;

  factory NoteBirdHof.fromJson(Map<String, dynamic> json) => NoteBirdHof(
        hof: List<Hof>.from(json["hof"].map((x) => Hof.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hof": List<dynamic>.from(hof.map((x) => x.toJson())),
      };
}

class Hof {
  Hof({
    required this.id,
    required this.date,
    required this.score,
    required this.email,
    required this.userName,
  });

  int id;
  String date;
  int score;
  String email;
  String userName;

  factory Hof.fromJson(Map<String, dynamic> json) => Hof(
        id: json["id"],
        date: json["date"],
        score: json["score"],
        email: json["email"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "score": score,
        "email": email,
        "user_name": userName,
      };
}
