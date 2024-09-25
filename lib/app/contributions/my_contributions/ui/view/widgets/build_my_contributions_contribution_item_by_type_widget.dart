part of '../../imports/my_contributions_imports.dart';

class BuildMyContributionsContributionItemByTypeWidget extends StatelessWidget {
  final Contribution contribution;

  const BuildMyContributionsContributionItemByTypeWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    switch (contribution.type) {
      case ContributionType.qa:
        return BuildMyContributionsContributionItemQaContributionWidget(
          contribution: contribution as QAContribution,
        );
      case ContributionType.photo:
        return BuildMyContributionsContributionItemPhotoContributionWidget(
          contribution: contribution as PhotoContribution,
        );
      case ContributionType.idiom:
        final idiomContribution = contribution as IdiomContribution;
        return BuildMyContributionsContributionItemBodyDescriptionContributionWidget(
          body: idiomContribution.body,
          bodyLabel: AppTrans.idiomContributionBodyLabel,
          description: idiomContribution.description,
          descriptionLabel: AppTrans.idiomContributionDescriptionLabel,
        );
      case ContributionType.poem:
        final poemContribution = contribution as PoemContribution;
        return BuildMyContributionsContributionItemBodyDescriptionContributionWidget(
          body: poemContribution.body,
          bodyLabel: AppTrans.poemContributionBodyLabel,
          description: poemContribution.description,
          descriptionLabel: AppTrans.poemContributionDescriptionLabel,
        );
      case ContributionType.synonyms:
        final synonymsContribution = contribution as SynonymsContribution;
        return BuildMyContributionsContributionItemWordsContributionWidget(
          words: synonymsContribution.synonyms,
        );
      case ContributionType.slang:
        final slangContribution = contribution as SlangContribution;
        return BuildMyContributionsContributionItemWordsContributionWidget(
          words: slangContribution.slangWords,
        );
      case ContributionType.modernMeaning:
        final modernMeaningContribution =
            contribution as ModernMeaningContribution;
        return BuildMyContributionsContributionItemWordsContributionWidget(
          words: modernMeaningContribution.modernMeanings,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
