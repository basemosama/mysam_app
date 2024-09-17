import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:playx/playx.dart';

class FeatureChip extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final String? svgIcon;
  final String? imageUrl;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? width;

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
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: label?.isNotEmpty == true,
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 2.w,
            ),
        child: Chip(
          shape: Style.featureChipRoundedRectangleBorder,
          label: SizedBox(
            width: width,
            child: child ??
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null ||
                        svgIcon?.isNotEmpty == true ||
                        imageUrl?.isNotEmpty == true) ...[
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: icon != null
                            ? IconViewer(
                                icon: icon,
                                iconColor: color,
                                width: 16,
                                height: 16,
                                iconSize: 18,
                              )
                            : svgIcon?.isNotEmpty == true
                                ? IconViewer.svg(svgIcon: svgIcon)
                                : imageUrl?.isNotEmpty == true
                                    ? Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              imageUrl!,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                    ],
                    CustomText(
                      label ?? '',
                      color: color,
                      textAlign: TextAlign.center,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
          ),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          labelPadding:
              padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        ),
      ),
    );
  }
}
