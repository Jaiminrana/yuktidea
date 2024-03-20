import 'package:flutter/material.dart';
import 'package:yuktidea/utils/extensions.dart';

class JrPrimaryButton extends StatelessWidget {
  const JrPrimaryButton({
    super.key,
    required this.title,
    required this.titleColor,
    this.onTap,
    this.enabled = true,
    this.titleStyle,
    this.width,
    this.height,
    this.fontSize = 18,
    this.child,
    this.padding,
    this.color,
    this.borderColor = Colors.transparent,
    this.shape,
    this.weight = FontWeight.w400,
    this.maxLines,
    this.tapTargetSize,
    this.minimumButtonWidth = false,
    this.textAlign = TextAlign.center,
    this.textOverflow = TextOverflow.ellipsis,
    this.minimumSize = const MaterialStatePropertyAll(Size(20, 20)),
  });

  final VoidCallback? onTap;
  final bool enabled;
  final String title;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;
  final double fontSize;
  final Widget? child;
  final EdgeInsets? padding;
  final Color? color;
  final Color borderColor;
  final OutlinedBorder? shape;
  final FontWeight weight;
  final int? maxLines;
  final Color titleColor;
  final bool minimumButtonWidth;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final MaterialStateProperty<Size?> minimumSize;
  final MaterialTapTargetSize? tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: context.theme.elevatedButtonTheme.style?.copyWith(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            side: BorderSide(
              color: borderColor,
            ),
          ),
        ),
        padding: padding != null ? MaterialStateProperty.all(padding) : null,
        backgroundColor:
            color != null ? MaterialStateProperty.all(color) : null,
        minimumSize: minimumSize,
        tapTargetSize: tapTargetSize,
      ),
      onPressed: onTap,
      child: Text(
        title,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: textOverflow,
        style: titleStyle ??
            TextStyle(
              fontSize: fontSize,
              fontWeight: weight,
              color: titleColor,
            ),
      ),
    );
  }
}
