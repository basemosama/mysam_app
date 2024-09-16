part of '../../imports/create_contribution_imports.dart';

class BuildContributionByTypeForum extends StatelessWidget {
  final CreateContributionController controller;

  const BuildContributionByTypeForum({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Fimber.i('BuildContributionByTypeForum: ${controller.contributionType}');
    return switch (controller.contributionType) {
      ContributionType.qa => CreateQaContributionView(
          controller: controller as CreateQaContributionController,
        ),
      ContributionType.idiom => CreateIdiomContributionView(
          controller: controller as CreateIdiomContributionController,
        ),
      ContributionType.modernMeaning => CreateModernMeaningContributionView(
          controller: controller as CreateModernMeaningContributionController,
        ),
      ContributionType.photo => CreatePhotoContributionView(
          controller: controller as CreatePhotoContributionController,
        ),
      ContributionType.poem => CreatePoemContributionView(
          controller: controller as CreatePoemContributionController,
        ),
      ContributionType.slang => CreateSlangContributionView(
          controller: controller as CreateSlangContributionController,
        ),
      ContributionType.synonyms => CreateSynonymsContributionView(
          controller: controller as CreateSynonymsContributionController,
        ),
      _ => Container(),
    };
  }
}
