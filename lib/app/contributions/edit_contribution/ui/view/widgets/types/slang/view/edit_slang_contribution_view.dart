part of '../../../../../imports/edit_contribution_imports.dart';

class EditSlangContributionView extends StatelessWidget {
  final EditSlangContributionController controller;

  const EditSlangContributionView({required this.controller});

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
