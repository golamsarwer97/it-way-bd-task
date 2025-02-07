import 'package:flutter/material.dart';

import '../../core/theme/app_palette.dart';
import 'app_button.dart';

showAppDialog(
  BuildContext context, {
  String? title,
  String? message,
  bool? isNoInternet,
  Function()? onTap,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDialog(
            title: title ?? '',
            isNoInternet: isNoInternet ?? false,
            onTap: onTap,
          ),
        ],
      ),
    ),
  );
}

class AppDialog extends StatelessWidget {
  final String title;
  final bool isNoInternet;
  final void Function()? onTap;

  const AppDialog({
    Key? key,
    required this.title,
    required this.isNoInternet,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      decoration: BoxDecoration(
          color: AppPalette.backgroundColor2,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _messageFromCode(context, title),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          AppButton(
            // color: Colors.green.withOpacity(0.5),
            color: AppPalette.gradient2,
            title: 'OK',
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            onTap: onTap ??
                () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
          ),
        ],
      ),
    );
  }

  _messageFromCode(BuildContext context, String code) {
    if (isNoInternet) return 'Please check your network connectivity';

    return code;
  }
}

showAppDialogs(
  BuildContext context, {
  String? title,
  String? message,
  bool? isNoInternet,
  Function()? onTap,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDialogs(
            title: title ?? '',
            isNoInternet: isNoInternet ?? false,
            onTap: onTap,
          ),
        ],
      ),
    ),
  );
}

class AppDialogs extends StatelessWidget {
  final String title;
  final bool isNoInternet;
  final void Function()? onTap;

  const AppDialogs({
    Key? key,
    required this.title,
    required this.isNoInternet,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      decoration: BoxDecoration(
          color: AppPalette.backgroundColor2,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _messageFromCode(context, title),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          AppButton(
            // color: Colors.green.withOpacity(0.5),
            color: AppPalette.gradient2,
            title: 'OK',
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            onTap: onTap ??
                () {
                  Navigator.pop(context);
                  // Navigator.pop(context);
                },
          ),
        ],
      ),
    );
  }

  _messageFromCode(BuildContext context, String code) {
    if (isNoInternet) return 'Please check your network connectivity';

    return code;
  }
}
