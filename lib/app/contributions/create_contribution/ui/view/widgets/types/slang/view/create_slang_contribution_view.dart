part of '../../../../../imports/create_contribution_imports.dart';

class CreateSlangContributionView extends StatelessWidget {
  final CreateSlangContributionController controller;

  const CreateSlangContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildSlangContributionSecondStep(),
      ],
    );
  }
}
