import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/config/app_colors.dart';
import '../../shared/widgets/containers/leading_icon.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: const ListTile(
          leading: LeadingIcon(
            icon: CupertinoIcons.envelope,
          ),
          title: Text('Note Feb-2023'),
          subtitle: Text('Feb. 02, 2023',
            style: TextStyle(
                color: AppColors.mutedText
            ),
          )
      ),
    );
  }

}