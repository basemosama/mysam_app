part of '../../../../../imports/edit_contribution_imports.dart';

class EditModernMeaningContributionView extends StatelessWidget {
  final EditModernMeaningContributionController controller;

  const EditModernMeaningContributionView({required this.controller});

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
