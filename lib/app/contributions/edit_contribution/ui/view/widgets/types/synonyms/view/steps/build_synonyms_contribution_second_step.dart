part of '../../../../../../imports/edit_contribution_imports.dart';

class BuildSynonymsContributionSecondStep
    extends GetView<EditSynonymsContributionController> {
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
