part of '../../../imports/reviews_imports.dart';

class BuildReviewsContributionItemBodyDescriptionContributionWidget
    extends StatelessWidget {
  final String body;
  final String bodyLabel;
  final String? description;
  final String? descriptionLabel;

  const BuildReviewsContributionItemBodyDescriptionContributionWidget({
    required this.body,
    this.description,
    required this.bodyLabel,
    this.descriptionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BuildReviewsListItemFieldWidget(
      label: body,
      subtitle: description,
      padding: EdgeInsets.zero,
      labelColor: context.colors.onSurface,
      subtitleFontSize: 12.sp,
      maxLines: 2,
    );
  }
}
