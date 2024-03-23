import 'package:json_annotation/json_annotation.dart';

part 'study_country_req_dm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StudyCountryReqDm {
  const StudyCountryReqDm({required this.countryId});

  factory StudyCountryReqDm.fromJson(Map<String, dynamic> json) =>
      _$StudyCountryReqDmFromJson(json);

  final int countryId;

  Map<String, dynamic> toJson() => _$StudyCountryReqDmToJson(this);
}
