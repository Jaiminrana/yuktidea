import 'package:json_annotation/json_annotation.dart';

part 'study_country_res_dm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StudyCountryResDm {
  const StudyCountryResDm({
    this.profileStatus,
    this.role,
    this.selectedCountry,
  });

  factory StudyCountryResDm.fromJson(Map<String, dynamic> json) =>
      _$StudyCountryResDmFromJson(json);

  final String? profileStatus;
  final String? role;
  final String? selectedCountry;

  Map<String, dynamic> toJson() => _$StudyCountryResDmToJson(this);
}
