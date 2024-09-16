part of '../../../../../imports/create_contribution_imports.dart';

class CreatePhotoContributionView extends StatelessWidget {
  final CreatePhotoContributionController controller;

  const CreatePhotoContributionView({required this.controller});

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
