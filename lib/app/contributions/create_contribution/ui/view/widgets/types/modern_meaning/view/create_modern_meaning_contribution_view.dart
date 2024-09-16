part of '../../../../../imports/create_contribution_imports.dart';

class CreateModernMeaningContributionView extends StatelessWidget {
  final CreateModernMeaningContributionController controller;

  const CreateModernMeaningContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildModernMeaningContributionSecondStep(),
      ],
    );
  }
}
