import 'package:json_annotation/json_annotation.dart';

part 'otp_req_dm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OtpReqDm {
  const OtpReqDm({
    required this.telCode,
    required this.phone,
  });

  factory OtpReqDm.fromJson(Map<String, dynamic> json) =>
      _$OtpReqDmFromJson(json);

  final String telCode;
  final String phone;

  Map<String, dynamic> toJson() => _$OtpReqDmToJson(this);
}
