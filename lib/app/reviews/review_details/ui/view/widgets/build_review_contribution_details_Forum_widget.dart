part of '../../imports/review_details_imports.dart';

class BuildReviewContributionDetailsForumWidget extends StatelessWidget {
  final String label;
  final Widget? endLabelWidget;
  final String? subtitle;
  final Widget? child;
  final Color? labelColor;
  final String separator;
  final bool includeSeparator;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final double? subtitleFontSize;
  final bool isSubtitleTranslatable;

  const BuildReviewContributionDetailsForumWidget({
    required this.label,
    this.subtitle,
    this.child,
    this.endLabelWidget,
    this.includeSeparator = true,
    this.labelColor,
    this.separator = ': ',
    this.padding,
    this.maxLines,
    this.subtitleFontSize,
    this.isSubtitleTranslatable = false,
  });

  @override
  Widget build(BuildContext context) {
    if ((subtitle == null || subtitle!.isEmpty) && child == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.r,
        vertical: 8.r,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            maxLines: maxLines,
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
                    text: subtitle?.isNotEmpty == true
                        ? isSubtitleTranslatable
                            ? subtitle!.tr(context: context)
                            : subtitle!
                        : '',
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
