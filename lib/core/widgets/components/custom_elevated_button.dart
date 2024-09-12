import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:playx/playx.dart';

class CustomElevatedButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? label;
  final String? labelFont;
  final bool isLabelTranslatable;

  final double? fontSize;
  final Color? color;

  final Color? disabledBackground;
  final Widget? child;
  final BorderRadius? borderRadius;
  final OutlinedBorder? shape;

  final double? width;

  const CustomElevatedButton({
    this.margin,
    this.onPressed,
    this.isLoading = false,
    this.isLabelTranslatable = true,
    this.padding,
    this.fontSize,
    this.label,
    this.disabledBackground,
    this.child,
    this.borderRadius,
    this.width = double.infinity,
    this.shape,
    this.labelFont,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin ??
          EdgeInsets.symmetric(
            horizontal: 12.r,
            vertical: 12.r,
          ),
      width: width,
      child: PlatformElevatedButton(
        onPressed: onPressed != null
            ? () {
                if (isLoading) return;
                onPressed!();
              }
            : null,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 12.r,
              vertical: 20.r,
            ),
        material: (ctx, _) => MaterialElevatedButtonData(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: disabledBackground ??
                context.colors.disabledButtonBackgroundColor,
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: 12.r,
                  vertical: 20.r,
                ),
            shape: shape ??
                RoundedRectangleBorder(
                  borderRadius: borderRadius ?? Style.buttonBorderRadius,
                ),
            backgroundColor: color ?? context.colors.primary,
          ),
        ),
        color: color ?? context.colors.primary,
        cupertino: (ctx, _) => CupertinoElevatedButtonData(
          disabledColor: disabledBackground ??
              context.colors.disabledButtonBackgroundColor,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 12.r,
                vertical: 20.r,
              ),
          borderRadius: borderRadius ?? Style.buttonBorderRadius,
        ),
        child: _buildChildWidget(
          context,
          isEnabled: onPressed != null,
          labelFont: labelFont,
          isLabelTranslatable: isLabelTranslatable,
        ),
      ),
    );
  }

  Widget _buildChildWidget(
    BuildContext context, {
    required bool isEnabled,
    String? labelFont,
    bool isLabelTranslatable = true,
  }) {
    if (child != null) return child!;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: isLoading ? 0 : 1,
          duration: 150.milliseconds,
          child: CustomText(
            label ?? '',
            color: isEnabled
                ? context.colors.onPrimary
                : context.colors.subtitleTextColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            font: labelFont,
            isTranslatable: isLabelTranslatable,
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
                  ? context.colors.onPrimary
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
