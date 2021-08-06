// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicContent _$TopicContentFromJson(Map<String, dynamic> json) {
  return TopicContent(
    title: json['title'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$TopicContentToJson(TopicContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
