import 'package:flutter/material.dart';
import 'package:yuktidea/resources/resources.dart';
import 'package:yuktidea/utils/common%20widgets/jr_icon_button.dart';
import 'package:yuktidea/utils/extensions.dart';

class JrScaffold extends StatelessWidget {
  const JrScaffold({
    super.key,
    required this.child,
    this.assetName = Vectors.arrowBack,
    this.onTap,
  });

  final Widget child;
  final String assetName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: JrIconButton(
                assetName: assetName,
                onTap: onTap,
                margin: EdgeInsets.only(
                  top: context.heightFraction(sizeFraction: 0.03),
                  left: 30,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
