part of '../../imports/my_contributions_imports.dart';

class BuildMyContributionsListItemFieldWidget
    extends GetView<MyContributionsController> {
  final String label;
  final String? subtitle;
  final Widget? child;
  final bool includeSeparator;
  final Color? labelColor;
  final String separator;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final double? subtitleFontSize;

  const BuildMyContributionsListItemFieldWidget({
    required this.label,
    this.subtitle,
    this.child,
    this.includeSeparator = true,
    this.labelColor,
    this.separator = ': ',
    this.padding,
    this.maxLines,
    this.subtitleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 8.r,
            vertical: 8.r,
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: label.tr(context: context),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: labelColor ?? context.colors.primary,
                    fontFamily: fontFamily,
                  ),
                ),
                if (includeSeparator)
                  TextSpan(
                    text: separator,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: subtitleFontSize ?? 14.sp,
                      color: context.colors.primary,
                      fontFamily: fontFamily,
                    ),
                  ),
                if (subtitle?.isNotEmpty == true)
                  TextSpan(
                    text: subtitle?.isNotEmpty == true ? subtitle! : '',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: context.colors.subtitleTextColor,
                      fontFamily: fontFamily,
                    ),
                  ),
              ],
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
