import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final bool isNormal;
  final bool? isLoading;
  final PressedCallBack? onPressed;

  const PrimaryButton({
    required this.text,
    this.width,
    this.height,
    this.borderRadius,
    required this.isNormal,
    this.isLoading,
    this.onPressed,
    Key? key}) : super(key: key);

  get backgroundColor {
    return isNormal ? Colors.white :
    isLoading != null && isLoading == true ?
    AppColors.primary.withOpacity(0.7) : AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0)
          ),
          minimumSize: Size(width ?? 100, height ?? 50)
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
            style: TextStyle(
                color: isNormal ? Colors.black : Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

typedef PressedCallBack = void Function();