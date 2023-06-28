import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../shared/widgets/buttons/app_back_button.dart';
import '../../shared/widgets/containers/app_bar_title.dart';
import '../widgets/menu_item.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: const AppBackButton(),
          backgroundColor: Colors.white,
          title: const AppBarTitle(
            title: "Settings",
          )
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          MenuItem(
            icon: CupertinoIcons.bell_fill,
            title: "Notification",
            onTap: () {
              // Navigator.push(context, PageTransition(
              //     type: PageTransitionType.rightToLeft,
              //     child: NotificationSettings()
              // ));
            },
          ),
        ],
      ),
    );
  }
}
