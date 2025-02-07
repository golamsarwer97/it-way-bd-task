import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/theme/app_palette.dart';

showAppLoading(BuildContext context, {bool? dismiss}) {
  showDialog(
    context: context,
    barrierDismissible: dismiss ?? false,
    builder: (context) => Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppPalette.gradient2,
        size: 50,
      ),
    ),
  );
}
