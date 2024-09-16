part of '../../../imports/create_contribution_imports.dart';

class BuildContributionFieldWidget
    extends GetView<CreateContributionController> {
  final String label;
  final Widget? endLabelWidget;
  final Widget child;

  const BuildContributionFieldWidget({
    required this.label,
    required this.child,
    this.endLabelWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.r,
        vertical: 4.r,
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
                    label,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              if (endLabelWidget != null) endLabelWidget!,
            ],
          ),
          child,
        ],
      ),
    );
  }
}
