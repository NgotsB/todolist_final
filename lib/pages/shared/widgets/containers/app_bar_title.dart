import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';


class AppBarTitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  const AppBarTitle({
    required this.title,
    this.subTitle,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,
          style: const TextStyle(
              color: AppColors.primary
          ),
        ),
        if (subTitle != null) Text(subTitle!,
          style: const TextStyle(
              fontSize: 12,
              color: Colors.black
          ),
        )

      ],
    );
  }
}
