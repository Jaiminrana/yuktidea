import 'package:flutter/material.dart';

class AppConstant {
  const AppConstant._();

  static const String baseUrl = 'https://studylancer.yuktidea.com';
  static const String bearer = 'Bearer';
  static const String authorizationKey = 'Authorization';
  static const String studentEndPoint = 'student/login';
  static const String agentEndPoint = 'counsellor/login';

  static const Radius roundedBorder8 = Radius.circular(8);
  static const Radius roundedBorder10 = Radius.circular(10);
  static const Radius roundedBorder30 = Radius.circular(30);
  static const Radius roundedBorder50 = Radius.circular(50);
}
