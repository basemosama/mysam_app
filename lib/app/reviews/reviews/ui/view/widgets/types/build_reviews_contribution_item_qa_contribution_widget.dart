part of '../../../imports/reviews_imports.dart';

class BuildReviewsContributionItemQaContributionWidget extends StatelessWidget {
  final QAContribution contribution;

  const BuildReviewsContributionItemQaContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return BuildReviewsListItemFieldWidget(
      label: contribution.question,
      subtitle: contribution.answer,
      padding: EdgeInsets.zero,
      labelColor: context.colors.onSurface,
      subtitleFontSize: 12.sp,
      maxLines: 2,
    );
  }
}
