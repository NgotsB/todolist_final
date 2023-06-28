import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/helpers/image_checker.dart';
import '../../../models/user.model.dart';
import '../../shared/widgets/containers/user_avatar.dart';


class ProfileContainer extends StatelessWidget {
  final User user;
  const ProfileContainer({
    required this.user,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: 270,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -1),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                UserAvatar(
                  profilePicture: ImageChecker.checkImage(user.picture),
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user.completeName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: size.width / 1.5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.map_pin_ellipse,
                              color: Colors.grey,
                              size: 14,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(user.completeAddress ?? "Cagayan de Oro City",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
