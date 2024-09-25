part of '../../imports/details_imports.dart';

class BuildContributionDetailsContributionByTypeWidget extends StatelessWidget {
  final Contribution contribution;

  const BuildContributionDetailsContributionByTypeWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    switch (contribution.type) {
      case ContributionType.qa:
        return BuildContributionDetailsQaContributionWidget(
          contribution: contribution as QAContribution,
        );
      case ContributionType.photo:
        return BuildContributionDetailsPhotoContributionWidget(
          contribution: contribution as PhotoContribution,
        );
      case ContributionType.idiom:
        final idiomContribution = contribution as IdiomContribution;
        return BuildContributionDetailsBodyDescriptionContributionWidget(
          body: idiomContribution.body,
          bodyLabel: AppTrans.idiomContributionBodyLabel,
          description: idiomContribution.description,
          descriptionLabel: AppTrans.idiomContributionDescriptionLabel,
        );
      case ContributionType.poem:
        final poemContribution = contribution as PoemContribution;
        return BuildContributionDetailsBodyDescriptionContributionWidget(
          body: poemContribution.body,
          bodyLabel: AppTrans.poemContributionBodyLabel,
          description: poemContribution.description,
          descriptionLabel: AppTrans.poemContributionDescriptionLabel,
        );
      case ContributionType.synonyms:
        final synonymsContribution = contribution as SynonymsContribution;
        return BuildContributionDetailsWordsContributionWidget(
          words: synonymsContribution.synonyms,
        );
      case ContributionType.slang:
        final slangContribution = contribution as SlangContribution;
        return BuildContributionDetailsWordsContributionWidget(
          words: slangContribution.slangWords,
        );
      case ContributionType.modernMeaning:
        final modernMeaningContribution =
            contribution as ModernMeaningContribution;
        return BuildContributionDetailsWordsContributionWidget(
          words: modernMeaningContribution.modernMeanings,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
