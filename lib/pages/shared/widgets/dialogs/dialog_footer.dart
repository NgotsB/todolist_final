import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';
import '../../../../app/strings/buttons.dart';
import '../buttons/custom_button.dart';

class DialogFooter extends StatelessWidget {

  final String? confirmButtonText;

  const DialogFooter({
    this.confirmButtonText,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              child: CustomButton(
                text: Buttons.cancel,
                buttonColor: AppColors.dirtyWhite,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
          ),
          const SizedBox(width: 10),
          SizedBox(
              child: CustomButton(
                text: confirmButtonText ?? Buttons.confirm,
                buttonColor: AppColors.primary,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
          ),
        ],
      ),
    );
  }
}
