import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:playx/playx.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;

  const CustomDialog({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        shape: Style.dialogRoundedRectangleBorder,
        color: context.colors.surface,
        margin: EdgeInsets.all(8.r),
        child: Padding(padding: Style.defaultPadding, child: child),
      ),
    );
  }
}
