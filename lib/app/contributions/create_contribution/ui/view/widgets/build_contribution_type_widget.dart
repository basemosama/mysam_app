part of '../../imports/create_contribution_imports.dart';

class BuildContributionByTypeForum extends StatelessWidget {
  final CreateContributionController controller;

  const BuildContributionByTypeForum({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return switch (controller.contributionType) {
      ContributionType.qa => CreateQaContributionView(
          controller: controller as CreateQaContributionController,
        ),
      _ => Container(),
    };
  }
}
