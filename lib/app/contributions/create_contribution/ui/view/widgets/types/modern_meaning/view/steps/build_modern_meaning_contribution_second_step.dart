part of '../../../../../../imports/create_contribution_imports.dart';

class BuildModernMeaningContributionSecondStep
    extends GetView<CreateModernMeaningContributionController> {
  const BuildModernMeaningContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildContributionModernMeaningWordsWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
