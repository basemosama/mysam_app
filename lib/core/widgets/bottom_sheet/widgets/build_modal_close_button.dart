import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:playx/playx.dart';

class BuildModalCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BuildModalCloseButton({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      visualDensity: VisualDensity.comfortable,
      icon: Icon(
        Icons.close,
        color: context.colors.onSurface,
      ),
      onPressed: onPressed,
    );
  }
}
