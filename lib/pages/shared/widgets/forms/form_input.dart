import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';

class FormInput extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType inputType;
  final String? labelText;
  final String? hintText;
  final ValidatorCallBack? validator;
  final OnSubmitCallBack? onSubmit;
  final OnTapCallBack? onTap;
  final double? radius;
  final bool? autoFocus;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? labelFloat;
  final bool? enabled;
  final bool? readOnly;
  final double? marginTop;
  final double? marginBottom;

  const FormInput({
    required this.controller,
    required this.inputType,
    this.labelText,
    this.hintText,
    this.validator,
    this.onSubmit,
    this.onTap,
    this.radius,
    this.autoFocus,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.labelFloat,
    this.enabled,
    this.readOnly,
    this.marginTop,
    this.marginBottom,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        top: marginTop ?? 0,
        bottom: marginBottom ?? 0,
      ),
      child: TextFormField(
        keyboardType: inputType,
        autofocus: autoFocus ?? false,
        obscureText: obscureText ?? false,
        style: const TextStyle(color: AppColors.dark),
        controller: controller,
        validator: validator,
        enabled: enabled,
        onFieldSubmitted: onSubmit,
        onTapOutside: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: onTap,
        readOnly: readOnly != null ? readOnly! : false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
                color: AppColors.dark,
                fontSize: 15
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15
            ),
            prefixIcon: prefixIcon != null ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: prefixIcon,
            ) : null,
            prefixIconColor: AppColors.primary,
            suffixIcon: suffixIcon,
            suffixIconColor: AppColors.primary
        ),
        cursorColor: AppColors.primary,
      ),
    );
  }
}

typedef ValidatorCallBack = String? Function(String? value);
typedef OnSubmitCallBack = void Function(String? value);
typedef OnTapCallBack = void Function();