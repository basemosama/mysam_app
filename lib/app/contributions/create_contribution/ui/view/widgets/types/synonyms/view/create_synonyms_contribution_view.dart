part of '../../../../../imports/create_contribution_imports.dart';

class CreateSynonymsContributionView extends StatelessWidget {
  final CreateSynonymsContributionController controller;

  const CreateSynonymsContributionView({required this.controller});

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
