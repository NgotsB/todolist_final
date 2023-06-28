import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../app/config/app_colors.dart';

class AppBackButton extends StatelessWidget {

  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(CupertinoIcons.back,
        color: AppColors.primary,
      ),
    );
  }

}
