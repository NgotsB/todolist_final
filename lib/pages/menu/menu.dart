import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_list/pages/menu/widgets/menu_item.dart';
import 'package:todo_list/pages/menu/widgets/profile_container.dart';

import '../../app/strings/buttons.dart';
import '../../app/strings/texts.dart';
import '../../models/user.model.dart';
import '../change_password/change_password.dart';
import '../profile/profile.dart';
import '../shared/widgets/dialogs/confirmation_dialog.dart';
import 'app_settings/app_settings.dart';

class Menu extends StatelessWidget {

  final User user;
  final OnLogout onLogout;

  const Menu({
    required this.user,
    required this.onLogout,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        ProfileContainer(user: user),
        MenuItem(
          icon: CupertinoIcons.person_crop_circle_fill,
          title: "Profile",
          onTap: () {
            Navigator.push(context, PageTransition(
                type: PageTransitionType.rightToLeft,
                child: Profile()
            ));
          },
        ),
        MenuItem(
          icon: CupertinoIcons.lock_fill,
          title: "Change Password",
          onTap: () {
            Navigator.push(context, PageTransition(
                type: PageTransitionType.rightToLeft,
                child: ChangePassword()
            ));
          },
        ),
        MenuItem(
          icon: CupertinoIcons.settings_solid,
          title: "Settings",
          onTap: () {
            Navigator.push(context, PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const AppSettings()
            ));
          },
        ),
        MenuItem(
          icon: Icons.logout,
          title: "Sign Out",
          onTap: () async {
            dynamic confirm = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ConfirmationDialog(
                    title: Buttons.signOut,
                    message: Texts.logoutWarning,
                    confirmButtonText: Buttons.signOut,
                  );
                }
            );

            if (confirm == true) {
              onLogout();
            }
          },
        )
      ],
    );
  }
}


typedef OnLogout = void Function();