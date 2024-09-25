part of '../../../../../imports/edit_contribution_imports.dart';

class EditPoemContributionView extends StatelessWidget {
  final EditPoemContributionController controller;

  const EditPoemContributionView({required this.controller});

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
