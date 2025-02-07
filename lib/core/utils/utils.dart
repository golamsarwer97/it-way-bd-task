import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/theme/app_palette.dart';

getSnackBar(String message) {
  return Get.snackbar(
    "",
    "",
    titleText: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppPalette.gradient2,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.only(top: 15),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool? exitApp = await showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: const Text('Leaving The App'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: TextButton.styleFrom(
                // foregroundColor: primaryColor,
                ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            style: TextButton.styleFrom(
                // foregroundColor: primaryColor,
                ),
            child: const Text('Exit'),
          ),
        ],
      );
    },
  );
  return exitApp ?? false;
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
