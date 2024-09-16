part of '../../../../../imports/create_contribution_imports.dart';

class CreateIdiomContributionView extends StatelessWidget {
  final CreateIdiomContributionController controller;

  const CreateIdiomContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildIdiomContributionSecondStep(),
      ],
    );
  }
}
