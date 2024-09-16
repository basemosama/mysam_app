part of '../../../../../imports/create_contribution_imports.dart';

class CreateQaContributionView extends StatelessWidget {
  final CreateQaContributionController controller;

  const CreateQaContributionView({required this.controller});

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
