part of '../../imports/root_details_imports.dart';

class BuildRootDetailsContributionItemByTypeWidget extends StatelessWidget {
  final Contribution contribution;

  const BuildRootDetailsContributionItemByTypeWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    switch (contribution.type) {
      case ContributionType.qa:
        return BuildRootDetailsContributionItemQaContributionWidget(
          contribution: contribution as QAContribution,
        );
      case ContributionType.photo:
        return BuildRootDetailsContributionItemPhotoContributionWidget(
          contribution: contribution as PhotoContribution,
        );
      case ContributionType.idiom:
        final idiomContribution = contribution as IdiomContribution;
        return BuildRootDetailsContributionItemBodyDescriptionContributionWidget(
          body: idiomContribution.body,
          bodyLabel: AppTrans.idiomContributionBodyLabel,
          description: idiomContribution.description,
          descriptionLabel: AppTrans.idiomContributionDescriptionLabel,
        );
      case ContributionType.poem:
        final poemContribution = contribution as PoemContribution;
        return BuildRootDetailsContributionItemBodyDescriptionContributionWidget(
          body: poemContribution.body,
          bodyLabel: AppTrans.poemContributionBodyLabel,
          description: poemContribution.description,
          descriptionLabel: AppTrans.poemContributionDescriptionLabel,
        );
      case ContributionType.synonyms:
        final synonymsContribution = contribution as SynonymsContribution;
        return BuildRootDetailsContributionItemWordsContributionWidget(
          words: synonymsContribution.synonyms,
        );
      case ContributionType.slang:
        final slangContribution = contribution as SlangContribution;
        return BuildRootDetailsContributionItemWordsContributionWidget(
          words: slangContribution.slangWords,
        );
      case ContributionType.modernMeaning:
        final modernMeaningContribution =
            contribution as ModernMeaningContribution;
        return BuildRootDetailsContributionItemWordsContributionWidget(
          words: modernMeaningContribution.modernMeanings,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
