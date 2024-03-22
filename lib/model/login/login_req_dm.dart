import 'package:json_annotation/json_annotation.dart';

part 'login_req_dm.g.dart';

@JsonSerializable()
class LoginReqDm {
  const LoginReqDm({
    required this.telCode,
    required this.phone,
  });

  factory LoginReqDm.fromJson(Map<String, dynamic> json) =>
      _$LoginReqDmFromJson(json);

  @JsonKey(name: 'tel_code')
  final String telCode;
  final String phone;

  Map<String, dynamic> toJson() => _$LoginReqDmToJson(this);
}
