import 'package:flutter/material.dart';
import 'package:mysam_app/core/models/icon_info.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:playx/playx.dart';

class FeatureChip extends StatelessWidget {
  final String? label;
  final IconInfo? icon;
  final String? svgIcon;
  final String? imageUrl;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? width;
  final TextStyle? style;

  const FeatureChip({
    this.label,
    this.color = Colors.black,
    this.icon,
    this.svgIcon,
    this.backgroundColor,
    this.padding,
    this.imageUrl,
    this.child,
    this.width,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: label?.isNotEmpty == true,
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 2.r,
            ),
        child: Chip(
          shape: Style.featureChipRoundedRectangleBorder,
          label: SizedBox(
            width: width,
            child: child ??
                CustomText.icon(
                  label ?? '',
                  icon: icon,
                  color: color,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  textStyle: style,
                ),
          ),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
          labelPadding:
              padding ?? EdgeInsets.symmetric(horizontal: 8.r, vertical: 2.r),
        ),
      ),
    );
  }
}
