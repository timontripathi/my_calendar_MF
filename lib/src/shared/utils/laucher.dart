import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Launch {
  static Future<void> dialer({
    required BuildContext context,
    required String phoneNo,
  }) async {
    final parsedNumber = Uri(
      scheme: 'tel',
      path: phoneNo,
    );
    if (!await launchUrl(parsedNumber)) {
      if (context.mounted) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Can't Parsed The Given Number",
          ),
        );
      }
    }
  }
}
