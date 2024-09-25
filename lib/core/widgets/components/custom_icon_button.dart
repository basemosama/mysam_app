import 'package:flutter/material.dart';
import 'package:mysam_app/core/models/icon_info.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:playx/playx.dart';

class CustomIconButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconInfo? iconInfo;

  final Color? color;
  final Color? backgroundColor;

  final Color? disabledBackground;
  final Widget? child;
  final OutlinedBorder? shape;

  final double? width;
  final double? height;

  final BorderSide? borderSide;

  const CustomIconButton({
    this.margin,
    this.onPressed,
    this.isLoading = false,
    this.padding,
    this.iconInfo,
    this.disabledBackground,
    this.backgroundColor,
    this.child,
    this.width,
    this.height,
    this.shape,
    this.color,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin ??
          EdgeInsets.symmetric(
            vertical: 4.r,
          ),
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () {
                if (isLoading) return;
                onPressed!();
              }
            : null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disabledBackground ??
              context.colors.disabledButtonBackgroundColor,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 12.r,
                vertical: 12.r,
              ),
          shape: shape ??
              CircleBorder(
                side: borderSide ?? BorderSide.none,
              ),
          backgroundColor: backgroundColor ?? context.colors.onSurface,
        ),
        child: child ??
            (iconInfo != null
                ? _buildChildWidget(
                    context,
                    isEnabled: onPressed != null,
                    iconInfo: iconInfo!,
                  )
                : null),
      ),
    );
  }

  Widget _buildChildWidget(
    BuildContext context, {
    required bool isEnabled,
    required IconInfo iconInfo,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: isLoading ? 0 : 1,
          duration: 150.milliseconds,
          child: SizedBox(
            width: width,
            height: height,
            child: iconInfo.buildIconWidget(
              color: color ?? context.colors.surface,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: isLoading ? 1 : 0,
          duration: 150.milliseconds,
          child: SizedBox(
            height: 20.r,
            width: 20.r,
            child: CenterLoading.adaptive(
              color: isEnabled
                  ? context.colors.surface
                  : context.colors.subtitleTextColor,
              radius: 10.r,
              strokeWidth: 3.r,
            ),
          ),
        ),
      ],
    );
  }
}
