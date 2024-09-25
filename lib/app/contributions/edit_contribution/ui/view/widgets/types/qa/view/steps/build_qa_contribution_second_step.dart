part of '../../../../../../imports/edit_contribution_imports.dart';

class BuildQaContributionSecondStep
    extends GetView<EditQaContributionController> {
  const BuildQaContributionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildContributionMainFormRootWidget(controller: controller),
          const BuildQaContributionQuestionFieldWidget(),
          const BuildQaContributionAnswerFieldWidget(),
          SizedBox(height: 64.r),
        ],
      ),
    );
  }
}
