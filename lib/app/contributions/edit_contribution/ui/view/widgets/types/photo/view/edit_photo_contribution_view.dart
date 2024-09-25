part of '../../../../../imports/edit_contribution_imports.dart';

class EditPhotoContributionView extends StatelessWidget {
  final EditPhotoContributionController controller;

  const EditPhotoContributionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [
        BuildContributionMainForm(
          controller: controller,
        ),
        const BuildPhotoContributionSecondStep(),
      ],
    );
  }
}
