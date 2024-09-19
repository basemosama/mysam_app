part of '../../imports/reviews_imports.dart';

class BuildReviewsContributionItemByTypeWidget extends StatelessWidget {
  final Contribution contribution;

  const BuildReviewsContributionItemByTypeWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    switch (contribution.type) {
      case ContributionType.qa:
        return BuildReviewsContributionItemQaContributionWidget(
          contribution: contribution as QAContribution,
        );
      case ContributionType.photo:
        return BuildReviewsContributionItemPhotoContributionWidget(
          contribution: contribution as PhotoContribution,
        );
      case ContributionType.idiom:
        final idiomContribution = contribution as IdiomContribution;
        return BuildReviewsContributionItemBodyDescriptionContributionWidget(
          body: idiomContribution.body,
          bodyLabel: AppTrans.idiomContributionBodyLabel,
          description: idiomContribution.description,
          descriptionLabel: AppTrans.idiomContributionDescriptionLabel,
        );
      case ContributionType.poem:
        final poemContribution = contribution as PoemContribution;
        return BuildReviewsContributionItemBodyDescriptionContributionWidget(
          body: poemContribution.body,
          bodyLabel: AppTrans.poemContributionBodyLabel,
          description: poemContribution.description,
          descriptionLabel: AppTrans.poemContributionDescriptionLabel,
        );
      case ContributionType.synonyms:
        final synonymsContribution = contribution as SynonymsContribution;
        return BuildReviewsContributionItemWordsContributionWidget(
          label: AppTrans.contributionDetailsLabel,
          words: synonymsContribution.synonyms,
        );
      case ContributionType.slang:
        final slangContribution = contribution as SlangContribution;
        return BuildReviewsContributionItemWordsContributionWidget(
          label: AppTrans.contributionDetailsLabel,
          words: slangContribution.slangWords,
        );
      case ContributionType.modernMeaning:
        final modernMeaningContribution =
            contribution as ModernMeaningContribution;
        return BuildReviewsContributionItemWordsContributionWidget(
          label: AppTrans.contributionDetailsLabel,
          words: modernMeaningContribution.modernMeanings,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
