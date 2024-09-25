part of '../../../../../../imports/create_contribution_imports.dart';

class BuildSynonymsContributionSecondStep
    extends GetView<CreateSynonymsContributionController> {
  const BuildSynonymsContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildContributionSynonymsWordsWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
