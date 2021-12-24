// To parse this JSON data, do
//
//     final noteBirdModel = noteBirdModelFromJson(jsonString);

import 'dart:convert';

NoteBirdModel noteBirdModelFromJson(String str) =>
    NoteBirdModel.fromJson(json.decode(str));

String noteBirdModelToJson(NoteBirdModel data) => json.encode(data.toJson());

class NoteBirdModel {
  NoteBirdModel({
    required this.gameScoreInfo,
    required this.status,
  });

  GameScoreInfo gameScoreInfo;
  String status;

  factory NoteBirdModel.fromJson(Map<String, dynamic> json) => NoteBirdModel(
        gameScoreInfo: GameScoreInfo.fromJson(json["gameScoreInfo"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "gameScoreInfo": gameScoreInfo.toJson(),
        "status": status,
      };
}

class GameScoreInfo {
  GameScoreInfo({
    required this.date,
    required this.score,
    required this.email,
    required this.userName,
  });

  String date;
  int score;
  String email;
  String userName;

  factory GameScoreInfo.fromJson(Map<String, dynamic> json) => GameScoreInfo(
        date: json["date"],
        score: json["score"],
        email: json["email"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "score": score,
        "email": email,
        "user_name": userName,
      };
}
