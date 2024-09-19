part of '../../imports/edit_contribution_imports.dart';

class BuildContributionByTypeForum extends StatelessWidget {
  final EditContributionController controller;

  const BuildContributionByTypeForum({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return switch (controller.contribution.type) {
      ContributionType.qa => EditQaContributionView(
          controller: controller as EditQaContributionController,
        ),
      ContributionType.idiom => EditIdiomContributionView(
          controller: controller as EditIdiomContributionController,
        ),
      ContributionType.modernMeaning => EditModernMeaningContributionView(
          controller: controller as EditModernMeaningContributionController,
        ),
      ContributionType.photo => EditPhotoContributionView(
          controller: controller as EditPhotoContributionController,
        ),
      ContributionType.poem => EditPoemContributionView(
          controller: controller as EditPoemContributionController,
        ),
      ContributionType.slang => EditSlangContributionView(
          controller: controller as EditSlangContributionController,
        ),
      ContributionType.synonyms => EditSynonymsContributionView(
          controller: controller as EditSynonymsContributionController,
        ),
      _ => Container(),
    };
  }
}
