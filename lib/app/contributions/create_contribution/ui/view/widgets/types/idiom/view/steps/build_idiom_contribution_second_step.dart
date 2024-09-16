part of '../../../../../../imports/create_contribution_imports.dart';

class BuildIdiomContributionSecondStep
    extends GetView<CreateIdiomContributionController> {
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
