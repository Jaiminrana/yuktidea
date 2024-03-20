
import 'package:flutter/material.dart';
import 'package:yuktidea/apibase/repository.dart';
import 'package:yuktidea/app.dart';
import 'package:yuktidea/utils/helper.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  @override
  void initState() {
    setAppOrientation();
    Repository.instance.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const YukIdeaApp();
  }
}
