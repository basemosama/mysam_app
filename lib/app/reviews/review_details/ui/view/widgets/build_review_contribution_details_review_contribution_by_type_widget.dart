part of '../../imports/review_details_imports.dart';

class BuildReviewContributionDetailsContributionByTypeWidget
    extends StatelessWidget {
  final Contribution contribution;

  const BuildReviewContributionDetailsContributionByTypeWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    switch (contribution.type) {
      case ContributionType.qa:
        return BuildReviewContributionDetailsQaContributionWidget(
          contribution: contribution as QAContribution,
        );
      case ContributionType.photo:
        return BuildReviewContributionDetailsPhotoContributionWidget(
          contribution: contribution as PhotoContribution,
        );
      case ContributionType.idiom:
        final idiomContribution = contribution as IdiomContribution;
        return BuildReviewContributionDetailsBodyDescriptionContributionWidget(
          body: idiomContribution.body,
          bodyLabel: AppTrans.idiomContributionBodyLabel,
          description: idiomContribution.description,
          descriptionLabel: AppTrans.idiomContributionDescriptionLabel,
        );
      case ContributionType.poem:
        final poemContribution = contribution as PoemContribution;
        return BuildReviewContributionDetailsBodyDescriptionContributionWidget(
          body: poemContribution.body,
          bodyLabel: AppTrans.poemContributionBodyLabel,
          description: poemContribution.description,
          descriptionLabel: AppTrans.poemContributionDescriptionLabel,
        );
      case ContributionType.synonyms:
        final synonymsContribution = contribution as SynonymsContribution;
        return BuildReviewContributionDetailsWordsContributionWidget(
          words: synonymsContribution.synonyms,
        );
      case ContributionType.slang:
        final slangContribution = contribution as SlangContribution;
        return BuildReviewContributionDetailsWordsContributionWidget(
          words: slangContribution.slangWords,
        );
      case ContributionType.modernMeaning:
        final modernMeaningContribution =
            contribution as ModernMeaningContribution;
        return BuildReviewContributionDetailsWordsContributionWidget(
          words: modernMeaningContribution.modernMeanings,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
