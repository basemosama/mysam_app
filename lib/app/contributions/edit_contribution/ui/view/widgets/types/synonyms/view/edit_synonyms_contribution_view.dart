part of '../../../../../imports/edit_contribution_imports.dart';

class EditSynonymsContributionView extends StatelessWidget {
  final EditSynonymsContributionController controller;

  const EditSynonymsContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildSynonymsContributionSecondStep(),
      ],
    );
  }
}
