part of '../../../../../imports/edit_contribution_imports.dart';

class EditIdiomContributionView extends StatelessWidget {
  final EditIdiomContributionController controller;

  const EditIdiomContributionView({required this.controller});

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
