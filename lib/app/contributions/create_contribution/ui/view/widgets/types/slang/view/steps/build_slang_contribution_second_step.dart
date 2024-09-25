part of '../../../../../../imports/create_contribution_imports.dart';

class BuildSlangContributionSecondStep
    extends GetView<CreateSlangContributionController> {
  const BuildSlangContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildContributionSlangWordsWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
