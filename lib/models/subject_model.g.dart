// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(
    subName: json['subName'] as String?,
    route: json['route'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'subName': instance.subName,
      'route': instance.route,
      'url': instance.url,
    };
