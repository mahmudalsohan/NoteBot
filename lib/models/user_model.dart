// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.status,
  });

  User user;
  String status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "status": status,
      };
}

class User {
  User({
    required this.email,
    required this.uniId,
    required this.batch,
    required this.dept,
  });

  String email;
  String uniId;
  String batch;
  String dept;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        uniId: json["uni_id"],
        batch: json["batch"],
        dept: json["dept"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "uni_id": uniId,
        "batch": batch,
        "dept": dept,
      };
}
