part of '../../../../../imports/create_contribution_imports.dart';

class CreatePoemContributionView extends StatelessWidget {
  final CreatePoemContributionController controller;

  const CreatePoemContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildPoemContributionSecondStep(),
      ],
    );
  }
}
