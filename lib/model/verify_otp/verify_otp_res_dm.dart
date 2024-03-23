import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_res_dm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VerifyOtpResDm {
  const VerifyOtpResDm({
    this.role,
    this.phone,
    this.accessToken,
    this.tokenType,
  });

  factory VerifyOtpResDm.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResDmFromJson(json);

  final String? role;
  final String? phone;
  final String? accessToken;
  final String? tokenType;

  Map<String, dynamic> toJson() => _$VerifyOtpResDmToJson(this);
}
