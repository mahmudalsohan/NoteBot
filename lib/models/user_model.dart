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
    required this.role,
    required this.imgUrl,
  });

  String email;
  String uniId;
  String batch;
  String dept;
  String role;
  String? imgUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        uniId: json["uni_id"],
        batch: json["batch"],
        dept: json["dept"],
        role: json["role"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "uni_id": uniId,
        "batch": batch,
        "dept": dept,
        "role": role,
        "imgUrl": imgUrl,
      };
}
