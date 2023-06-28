import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageChecker {

  /*
   * Check Image Link if valid
   * @param link String
   * @return String
   */
  static checkImage(String? imageLink) {
    if (imageLink == null || imageLink == "") {
      return "";
    }
    return imageLink.contains('http')
        ? imageLink : dotenv.env['MEDIA_URL']! + imageLink;
  }
}