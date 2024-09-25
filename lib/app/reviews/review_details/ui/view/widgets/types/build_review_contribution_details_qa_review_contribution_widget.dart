part of '../../../imports/review_details_imports.dart';

class BuildReviewContributionDetailsQaContributionWidget
    extends StatelessWidget {
  final QAContribution contribution;

  const BuildReviewContributionDetailsQaContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildReviewContributionDetailsForumWidget(
          label: AppTrans.questionLabel,
          subtitle: contribution.question,
          labelColor: context.colors.onSurface,
        ),
        BuildReviewContributionDetailsForumWidget(
          label: AppTrans.answerLabel,
          subtitle: contribution.answer,
          labelColor: context.colors.onSurface,
        ),
      ],
    );
  }
}
