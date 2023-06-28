import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/notifications/widgets/notification_item.dart';

import '../../app/config/app_colors.dart';
import '../shared/widgets/buttons/app_back_button.dart';
import 'notification.controller.dart';


class Notifications extends StatelessWidget {

  Notifications({Key? key}) : super(key: key);
  final nc = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: const AppBackButton(),
          title: const Text("Notifications",
            style: TextStyle(
                color: AppColors.primary
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            NotificationItem(),
            NotificationItem(),
            NotificationItem(),
          ],
        )
    );
  }

}