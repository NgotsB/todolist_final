import 'package:flutter/material.dart';

import '../../../../app/config/app_colors.dart';
import 'hidden_container.dart';


class ValueText extends StatelessWidget {

  final String keyText;
  final String value;
  final bool isEditable;
  final bool isColored;
  final int? keyWidth;
  final double? bottomPadding;
  final EditCallBack? onEdit;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final EdgeInsets? margin;
  final bool? hasEdit;

  const ValueText({
    required this.keyText,
    required this.value,
    required this.isEditable,
    required this.isColored,
    this.keyWidth,
    this.bottomPadding,
    this.onEdit,
    this.verticalPadding,
    this.horizontalPadding,
    this.textAlign,
    this.fontWeight,
    this.margin,
    this.hasEdit,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 15, horizontal: horizontalPadding ?? 10),
      decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: AppColors.tertiary),
          )
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: keyWidth ?? 3,
              child: Text(keyText,
                style: const TextStyle(
                    color: AppColors.mutedText
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 8,
              child: Text(value,
                textAlign: textAlign ?? TextAlign.start,
                style: TextStyle(
                    color: isColored ? AppColors.primary : Colors.black,
                    fontWeight: fontWeight ?? FontWeight.normal
                ),
              ),
            ),
            (isEditable) ? InkWell(
                onTap: onEdit,
                child: const Text("Edit",
                  style: TextStyle(
                      color: AppColors.primary
                  ),
                )
            ) : hasEdit != null ? const Text("      " ,
              style: TextStyle(
                color: Colors.transparent,

              ),
            ) : const HiddenContainer()
          ],
        ),
      ),
    );
  }
}


typedef EditCallBack = void Function();