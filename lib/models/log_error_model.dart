// To parse this JSON data, do
//
//     final logErrorModel = logErrorModelFromJson(jsonString);

import 'dart:convert';

LogErrorModel logErrorModelFromJson(String str) =>
    LogErrorModel.fromJson(json.decode(str));

String logErrorModelToJson(LogErrorModel data) => json.encode(data.toJson());

class LogErrorModel {
  LogErrorModel({
    required this.errorInfo,
    required this.status,
  });

  ErrorInfo errorInfo;
  String status;

  factory LogErrorModel.fromJson(Map<String, dynamic> json) => LogErrorModel(
        errorInfo: ErrorInfo.fromJson(json["errorInfo"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "errorInfo": errorInfo.toJson(),
        "status": status,
      };
}

class ErrorInfo {
  ErrorInfo({
    required this.date,
    required this.email,
    required this.os,
    required this.log,
  });

  String date;
  String email;
  String os;
  String log;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        date: json["date"],
        email: json["email"],
        os: json["os"],
        log: json["log"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "email": email,
        "os": os,
        "log": log,
      };
}
