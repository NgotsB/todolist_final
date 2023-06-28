import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_images.dart';

class UserAvatar extends StatelessWidget {
  final String? profilePicture;
  final String? initials;
  final double? width;
  final double? height;
  final Color? borderColor;

  const UserAvatar({
    this.profilePicture,
    this.height,
    this.width,
    this.initials,
    this.borderColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? profilePicture = this.profilePicture ?? "";

    return profilePicture.isNotEmpty ? SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: profilePicture,
          imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor ?? AppColors.primary,
                  width: 1.0,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain, image: imageProvider
                ),
              )
          ),
          errorWidget: (context, url, error) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor ?? AppColors.primary,
                  width: 1.0,
                ),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppImages.defaultAvatar)
                )
            ),
          ),
        )
    ) : Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: borderColor ?? AppColors.primary,
          width: 1.0,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
          child: initials != null ? Text(initials!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ) : Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor ?? AppColors.primary,
                  width: 3.0,
                ),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppImages.defaultAvatar)
                )
            ),
          )
      ),
    );
  }
}
