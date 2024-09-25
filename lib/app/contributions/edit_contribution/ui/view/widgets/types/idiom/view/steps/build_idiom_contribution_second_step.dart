part of '../../../../../../imports/edit_contribution_imports.dart';

class BuildIdiomContributionSecondStep
    extends GetView<EditIdiomContributionController> {
  const BuildIdiomContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildIdiomContributionBodyFieldWidget(),
          const BuildIdiomContributionDescriptionFieldWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
