import 'package:json_annotation/json_annotation.dart';

part 'select_country_dm.g.dart';

@JsonSerializable()
class SelectCountryDm {
  SelectCountryDm({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final DataDm? data;

  factory SelectCountryDm.fromJson(Map<String, dynamic> json) =>
      _$SelectCountryDmFromJson(json);

  Map<String, dynamic> toJson() => _$SelectCountryDmToJson(this);
}

@JsonSerializable()
class DataDm {
  DataDm({
    this.profileStatus,
    this.role,
    this.selectedCountry,
    this.countries,
  });

  final String? profileStatus;
  final String? role;
  final dynamic selectedCountry;
  final List<CountryDm>? countries;

  factory DataDm.fromJson(Map<String, dynamic> json) => _$DataDmFromJson(json);

  Map<String, dynamic> toJson() => _$DataDmToJson(this);
}

@JsonSerializable()
class CountryDm {
  CountryDm({
    this.id,
    this.name,
    this.flag,
    this.image,
  });

  final int? id;
  final String? name;
  final String? flag;
  final String? image;

  factory CountryDm.fromJson(Map<String, dynamic> json) =>
      _$CountryDmFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDmToJson(this);
}
