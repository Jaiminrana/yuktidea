import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_req_dm.g.dart';

@JsonSerializable()
class VerifyOtpReqDm {
  const VerifyOtpReqDm({
    required this.code,
    required this.phone,
  });

  factory VerifyOtpReqDm.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpReqDmFromJson(json);

  final String code;
  final String phone;

  Map<String, dynamic> toJson() => _$VerifyOtpReqDmToJson(this);
}
