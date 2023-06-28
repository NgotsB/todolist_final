import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';

class LeadingIcon extends StatelessWidget {

  final IconData icon;
  const LeadingIcon({
    required this.icon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(icon,
          size: 20,
          color: Colors.white
      ),
    );
  }
}
