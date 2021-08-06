import 'package:json_annotation/json_annotation.dart';

part 'topic_content_model.g.dart';

@JsonSerializable()
class TopicContent {
  String title;
  String url;
  TopicContent({
    required this.title,
    required this.url,
  });

  factory TopicContent.fromJson(Map<String, dynamic> json) =>
      _$TopicContentFromJson(json);
  Map<String, dynamic> toJson() => _$TopicContentToJson(this);
}
