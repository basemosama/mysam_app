part of '../../../../../imports/edit_contribution_imports.dart';

class EditQaContributionView extends StatelessWidget {
  final EditQaContributionController controller;

  const EditQaContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildQaContributionSecondStep(),
      ],
    );
  }
}
