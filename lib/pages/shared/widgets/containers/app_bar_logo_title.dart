import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_images.dart';
import '../../../../app/helpers/image_checker.dart';


class AppBarLogoTitle extends StatelessWidget {

  final String? image;
  final String text;
  final String? subText;
  final Widget? subWidget;
  final bool? isSquare;

  const AppBarLogoTitle({
    this.image,
    required this.text,
    this.subText,
    this.subWidget,
    this.isSquare,
    Key? key}) : super(key: key);

  get appBarImage {
    return image != null ? SizedBox(
        width: 40,
        height: 40,
        child: CachedNetworkImage(
          imageUrl: ImageChecker.checkImage(image),
          imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 1.0,
                ),
                shape: isSquare != null && isSquare == true ? BoxShape.rectangle : BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider
                ),
              )
          ),
          errorWidget: (context, url, error) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 1.0,
                ),
                shape: isSquare != null && isSquare == true ? BoxShape.rectangle :  BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.defaultAvatar)
                )
            ),
          ),
        )
    ) : Image.asset(AppImages.logo, height: 45);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        appBarImage,
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
              style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 16
              ),
            ),
            if (subWidget != null) subWidget!,
            if (subText != null) Text(subText ?? dotenv.env['APP_NAME']!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12
              ),
            ),

          ],
        )
      ],
    );
  }
}
