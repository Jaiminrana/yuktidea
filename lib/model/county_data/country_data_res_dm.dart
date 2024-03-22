import 'package:json_annotation/json_annotation.dart';

part 'country_data_res_dm.g.dart';

@JsonSerializable()
class CountryDataResDm {
  CountryDataResDm({
    this.name,
    this.telCode,
    this.flag,
  });

  final String? name;
  @JsonKey(name: 'tel_code')
  final String? telCode;
  final String? flag;

  factory CountryDataResDm.fromJson(Map<String, dynamic> json) =>
      _$CountryDataResDmFromJson(json);
}
