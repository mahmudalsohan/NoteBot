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
    required this.sponsoredContent,
    required this.communities,
    required this.tools,
  });

  ApiInfo apiInfo;
  List<InMemoryOf> inMemoryOf;
  List<SponsoredContent> sponsoredContent;
  List<Community> communities;
  List<Tool> tools;

  factory BaseRequest.fromJson(Map<String, dynamic> json) => BaseRequest(
        apiInfo: ApiInfo.fromJson(json["apiInfo"]),
        inMemoryOf: List<InMemoryOf>.from(
            json["inMemoryOf"].map((x) => InMemoryOf.fromJson(x))),
        sponsoredContent: List<SponsoredContent>.from(
            json["sponsoredContent"].map((x) => SponsoredContent.fromJson(x))),
        communities: List<Community>.from(
            json["communities"].map((x) => Community.fromJson(x))),
        tools: List<Tool>.from(json["tools"].map((x) => Tool.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "apiInfo": apiInfo.toJson(),
        "inMemoryOf": List<dynamic>.from(inMemoryOf.map((x) => x.toJson())),
        "sponsoredContent":
            List<dynamic>.from(sponsoredContent.map((x) => x.toJson())),
        "communities": List<dynamic>.from(communities.map((x) => x.toJson())),
        "tools": List<dynamic>.from(tools.map((x) => x.toJson())),
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

class Community {
  Community({
    required this.title,
    required this.description,
    required this.url,
    required this.imgUrl,
    required this.category,
  });

  String title;
  String description;
  String url;
  String imgUrl;
  List<String> category;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        imgUrl: json["imgUrl"],
        category: List<String>.from(json["category"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
        "imgUrl": imgUrl,
        "category": List<dynamic>.from(category.map((x) => x)),
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

class SponsoredContent {
  SponsoredContent({
    required this.title,
    required this.description,
    this.url,
    required this.imgUrl,
    required this.type,
    required this.accentColor,
  });

  String title;
  String description;
  dynamic url;
  String imgUrl;
  String type;
  List<String> accentColor;

  factory SponsoredContent.fromJson(Map<String, dynamic> json) =>
      SponsoredContent(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        imgUrl: json["imgUrl"],
        type: json["type"],
        accentColor: List<String>.from(json["accentColor"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
        "imgUrl": imgUrl,
        "type": type,
        "accentColor": List<dynamic>.from(accentColor.map((x) => x)),
      };
}

class Tool {
  Tool({
    required this.title,
    required this.url,
  });

  String title;
  String url;

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}
