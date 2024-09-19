part of '../../../../../../imports/edit_contribution_imports.dart';

class BuildPoemContributionSecondStep
    extends GetView<EditPoemContributionController> {
  const BuildPoemContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildPoemContributionBodyFieldWidget(),
          const BuildPoemContributionDescriptionFieldWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
