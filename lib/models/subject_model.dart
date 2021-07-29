import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class Subject {
  String? subName, route, url;
  Subject({this.subName, this.route, this.url});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
