import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final PressedCallBack? onPressed;
  final bool? isLoading;

  const CustomButton({
    required this.text,
    this.buttonColor,
    this.textColor,
    this.borderRadius,
    this.onPressed,
    this.isLoading,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: buttonColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10.0)
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          minimumSize: const Size(100, 40)
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading != null && isLoading == true) const Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white),
            ),
          ),
          Text(text,
            overflow: TextOverflow.clip,
            style: TextStyle(
                color: textColor ?? Colors.black
            ),
          ),
        ],
      ),
    );
  }
}


typedef PressedCallBack = void Function();