// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    topic: json['topic'] as String,
    route: json['route'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'topic': instance.topic,
      'route': instance.route,
      'url': instance.url,
    };
