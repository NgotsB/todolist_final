import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';

class HeaderTitle extends StatelessWidget {

  final IconData? icon;
  final String title;
  final double? marginTop;
  final double? marginBottom;
  final double? horizontalPadding;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final BorderRadius? borderRadius;

  const HeaderTitle({
    this.icon,
    required this.title,
    this.marginTop,
    this.marginBottom,
    this.horizontalPadding,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.textStyle,
    this.fontSize,
    this.borderRadius,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: horizontalPadding ?? 10),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: borderRadius ?? BorderRadius.zero
      ),
      child: Column(
        children: [
          SizedBox(height: marginTop ?? 0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: iconColor ?? AppColors.mutedText, size: 16),
              if (icon != null) const SizedBox(width: 5),
              Text(title,
                style: textStyle ?? TextStyle(
                    fontSize: fontSize ?? 12,
                    color: textColor ?? AppColors.mutedText
                ),
              ),
            ],
          ),
          SizedBox(height: marginBottom ?? 10)
        ],
      ),
    );
  }
}
