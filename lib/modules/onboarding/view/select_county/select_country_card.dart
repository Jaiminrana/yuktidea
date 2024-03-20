import 'package:flutter/material.dart';
import 'package:yuktidea/utils/common%20widgets/jr_network_Image.dart';
import 'package:yuktidea/utils/extensions.dart';
import 'package:yuktidea/values/app_constant.dart';

class SelectCountryCard extends StatelessWidget {
  const SelectCountryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.imageColor,
    required this.titleColor,
  });

  final String imageUrl;
  final String title;
  final Color imageColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JRNetworkImage(
          url: imageUrl,
          height: 80,
          width: 80,
          borderRadius: const BorderRadius.all(AppConstant.roundedBorder10),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
