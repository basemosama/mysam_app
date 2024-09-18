part of '../../imports/details_imports.dart';

class BuildContributionDetailsForumWidget extends StatelessWidget {
  final String label;
  final Widget? endLabelWidget;
  final String? subtitle;
  final Widget? child;
  final bool includeSeparator;

  const BuildContributionDetailsForumWidget({
    required this.label,
    this.subtitle,
    this.child,
    this.endLabelWidget,
    this.includeSeparator = false,
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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.r),
                  child: CustomText(
                    '${label.tr(context: context)}${includeSeparator ? ':' : ''}',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    isTranslatable: false,
                  ),
                ),
              ),
              if (endLabelWidget != null) endLabelWidget!,
            ],
          ),
          SizedBox(height: 8.r),
          if (subtitle?.isNotEmpty == true)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.r),
              child: CustomText(
                subtitle?.isNotEmpty == true ? subtitle! : '',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: context.colors.subtitleTextColor,
              ),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
