part of '../../imports/reviews_imports.dart';

class BuildReviewsListItemFieldWidget extends GetView<ReviewsController> {
  final String label;
  final String? subtitle;
  final Widget? _child;
  final bool includeSeparator;
  final Color? labelColor;
  final String separator;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final double? subtitleFontSize;

  const BuildReviewsListItemFieldWidget({
    required this.label,
    this.subtitle,
    Widget? child,
    this.includeSeparator = true,
    this.labelColor,
    this.separator = ': ',
    this.padding,
    this.maxLines,
    this.subtitleFontSize,
  }) : _child = child;

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
                      fontWeight: FontWeight.w500,
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
                if (_child != null)
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle, child: _child!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
