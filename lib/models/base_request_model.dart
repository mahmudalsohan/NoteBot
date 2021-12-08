// To parse this JSON data, do
//
//     final baseRequest = baseRequestFromJson(jsonString);

import 'dart:convert';

BaseRequest baseRequestFromJson(String str) =>
    BaseRequest.fromJson(json.decode(str));

String baseRequestToJson(BaseRequest data) => json.encode(data.toJson());

class BaseRequest {
  BaseRequest({
    required this.apiInfo,
    required this.inMemoryOf,
  });

  ApiInfo apiInfo;
  List<InMemoryOf> inMemoryOf;

  factory BaseRequest.fromJson(Map<String, dynamic> json) => BaseRequest(
        apiInfo: ApiInfo.fromJson(json["apiInfo"]),
        inMemoryOf: List<InMemoryOf>.from(
            json["inMemoryOf"].map((x) => InMemoryOf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "apiInfo": apiInfo.toJson(),
        "inMemoryOf": List<dynamic>.from(inMemoryOf.map((x) => x.toJson())),
      };
}

class ApiInfo {
  ApiInfo({
    required this.isApiLive,
    required this.primary,
    required this.secondary,
  });

  bool isApiLive;
  Ary primary;
  Ary secondary;

  factory ApiInfo.fromJson(Map<String, dynamic> json) => ApiInfo(
        isApiLive: json["isApiLive"],
        primary: Ary.fromJson(json["primary"]),
        secondary: Ary.fromJson(json["secondary"]),
      );

  Map<String, dynamic> toJson() => {
        "isApiLive": isApiLive,
        "primary": primary.toJson(),
        "secondary": secondary.toJson(),
      };
}

class Ary {
  Ary({
    required this.liveApiUrl,
    required this.noteApiUrl,
    required this.labApiUrl,
  });

  String liveApiUrl;
  String noteApiUrl;
  String labApiUrl;

  factory Ary.fromJson(Map<String, dynamic> json) => Ary(
        liveApiUrl: json["live_api_url"],
        noteApiUrl: json["note_api_url"],
        labApiUrl: json["lab_api_url"],
      );

  Map<String, dynamic> toJson() => {
        "live_api_url": liveApiUrl,
        "note_api_url": noteApiUrl,
        "lab_api_url": labApiUrl,
      };
}

class InMemoryOf {
  InMemoryOf({
    required this.name,
    required this.about,
    required this.diedIn,
  });

  String name;
  String about;
  int diedIn;

  factory InMemoryOf.fromJson(Map<String, dynamic> json) => InMemoryOf(
        name: json["name"],
        about: json["about"],
        diedIn: json["diedIn"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "about": about,
        "diedIn": diedIn,
      };
}
